terraform {
required_providers {
azurerm = {
source  = "hashicorp/azurerm"
version = "4.41.0"
}
}

cloud {
organization = "Arjun-Learning"

workspaces {
  name = "learn-terraform-azure"
}

}
}

provider "azurerm" {
features {}
}

############################

# Resource Group

############################

resource "azurerm_resource_group" "rg" {
name     = var.resource_group_name
location = var.location

tags = {
environment = "Terraform"
team        = "Learner"
project     = "Infrastructure"
}
}

############################

# Network

############################

resource "azurerm_virtual_network" "vnet" {
name                = "learner-terraform-vnet"
address_space       = ["10.0.0.0/16"]
location            = var.location
resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
name                 = "learner-terraform-subnet"
resource_group_name  = azurerm_resource_group.rg.name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
name                = "learner-terraform-nic"
location            = var.location
resource_group_name = azurerm_resource_group.rg.name

ip_configuration {
name                          = "internal"
subnet_id                     = azurerm_subnet.subnet.id
private_ip_address_allocation = "Dynamic"
}
}

############################

# Windows VM

############################

resource "azurerm_windows_virtual_machine" "vm" {
name                = "learnersmachine"
location            = var.location
resource_group_name = azurerm_resource_group.rg.name
size                = "Standard_B2s"

admin_username = var.admin_username
admin_password = var.admin_password

network_interface_ids = [
azurerm_network_interface.nic.id
]

os_disk {
caching              = "ReadWrite"
storage_account_type = "Standard_LRS"
}

source_image_reference {
publisher = "MicrosoftWindowsServer"
offer     = "WindowsServer"
sku       = "2022-Datacenter"
version   = "latest"
}
}

############################

# Storage Account

############################

resource "azurerm_storage_account" "sa" {
name                     = var.storage_account_name
resource_group_name      = azurerm_resource_group.rg.name
location                 = var.location
account_kind             = "StorageV2"
account_tier             = "Standard"
account_replication_type = "GRS"

tags = {
environment = "Terraform"
}
}

############################

# NetApp Resource Group

############################

resource "azurerm_resource_group" "netapp_rg" {
name     = var.netapp_resource_group_name
location = var.netapp_location

tags = {
environment = "Terraform"
team        = "NetApp"
project     = "Infrastructure"
}
}

############################

# NetApp Identity

############################

resource "azurerm_user_assigned_identity" "netapp_identity" {
name                = "learner-netapp-identity"
location            = azurerm_resource_group.netapp_rg.location
resource_group_name = azurerm_resource_group.netapp_rg.name
}

############################

# NetApp Account

############################

resource "azurerm_netapp_account" "netapp_account" {
name                = "learner-netapp-account"
location            = azurerm_resource_group.netapp_rg.location
resource_group_name = azurerm_resource_group.netapp_rg.name

active_directory {
username            = var.netapp_ad_username
password            = var.netapp_ad_password
smb_server_name     = var.netapp_smb_server
dns_servers         = var.netapp_dns_servers
domain              = var.netapp_domain
organizational_unit = var.netapp_ou
}

identity {
type = "UserAssigned"

```
identity_ids = [
  azurerm_user_assigned_identity.netapp_identity.id
]
```

}
}

############################

# NetApp Capacity Pool

############################

resource "azurerm_netapp_pool" "capacity_pool" {
name                = "learner-netapp-pool"
location            = azurerm_resource_group.netapp_rg.location
resource_group_name = azurerm_resource_group.netapp_rg.name
account_name        = azurerm_netapp_account.netapp_account.name
service_level       = "Premium"
size_in_tb          = 4
}

############################

# NetApp VNet

############################

resource "azurerm_virtual_network" "netapp_vnet" {
name                = "netapp-vnet"
location            = azurerm_resource_group.netapp_rg.location
resource_group_name = azurerm_resource_group.netapp_rg.name
address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "netapp_subnet" {
name                 = "netapp-subnet"
resource_group_name  = azurerm_resource_group.netapp_rg.name
virtual_network_name = azurerm_virtual_network.netapp_vnet.name
address_prefixes     = ["10.1.1.0/24"]

delegation {
name = "netapp"

```
service_delegation {
  name = "Microsoft.Netapp/volumes"

  actions = [
    "Microsoft.Network/networkinterfaces/*",
    "Microsoft.Network/virtualNetworks/subnets/join/action"
  ]
}
```

}
}
