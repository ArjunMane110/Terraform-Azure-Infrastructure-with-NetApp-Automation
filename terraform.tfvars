# -----------------------------

# General Infrastructure

# -----------------------------

resource_group_name = "example-terraform-rg"
location            = "West Europe"

tags = {
environment = "Terraform"
team        = "Learner"
project     = "Infrastructure"
}

# -----------------------------

# Virtual Machine

# -----------------------------

vm_name        = "example-vm"
admin_username = "azureadmin"
admin_password = "ReplaceWithSecurePassword123!"

# -----------------------------

# Storage

# -----------------------------

storage_account_name = "examplestorageacct123"

# -----------------------------

# NetApp Infrastructure

# -----------------------------

netapp_resource_group_name = "example-netapp-rg"
netapp_location            = "South Africa North"

managed_identity_name = "example-netapp-identity"

netapp_account_name = "example-netapp-account"

capacity_pool_name = "example-netapp-pool"

netapp_volume_name = "example-netapp-volume"

protocol = ["NFSv4.1"]

# -----------------------------

# NetApp Networking

# -----------------------------

netapp_vnet_name   = "example-netapp-vnet"
netapp_subnet_name = "example-netapp-subnet"

# -----------------------------

# NetApp Active Directory

# -----------------------------

active_directory = {
username            = "exampleaduser"
password            = "ReplaceWithSecurePassword!"
domain              = "example.com"
dns_servers         = ["1.2.3.4"]
smb_server_name     = "SMBSERVER"
organizational_unit = "OU=FirstLevel"
}

# -----------------------------

# Backup Configuration

# -----------------------------

backup_policy = "example-backup-policy"

backup_vault  = "example-backup-vault"
