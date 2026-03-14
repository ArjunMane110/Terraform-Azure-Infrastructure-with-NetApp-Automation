variable "ARM_SUBSCRIPTION_ID" {
  description = "Azure Subscription ID"
  type        = string
}

variable "ARM_CLIENT_ID" {
  description = "Service Principal Client ID"
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  description = "Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "ARM_TENANT_ID" {
  description = "Azure Tenant ID"
  type        = string
}


variable "subscription_id" {
  description = "The Subscription ID to deploy resources to"
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID to deploy resources to"
  type        = string
}

variable "resource_group_name" {
  description = "resource group name"
  default     = "learner-terraform-rg"
}

variable "location" {
  description = "resource group location"
  default     = "West Europe"
}

variable "tags" {
  description = "tags for the resources"
  type        = map(string)
  default = {
    environment = "Terraform"
    team        = "Learner"
    project     = "Infrastructure"
  }
}

variable "vnet_name" {
  description = "name of the virtual network"
  default     = "learner-terraform-vnet"
}

variable "subnet_name" {
  description = "name of the subnet"
  default     = "learner-terraform-subnet"
}

variable "nic_name" {
  description = "name of the network interface"
  default     = "learner-terraform-nic"
}

variable "vm_name" {
  description = "name of the virtual machine"
  default     = "learners-machine"
}

variable "admin_username" {
  description = "admin username for the virtual machine"
  default     = "adminlearning"
}

variable "admin_password" {
  description = "admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "storage_account_name" {
  description = "name of the storage account"
  default     = "learnerstorageaccount1"
}

## NetApp Account & Resource Group & Managed identity
variable "netapp_resource_group_name" {
  description = "NetApp resource group name"
  default     = "learner-netapp-rg"
}

variable "managed_identity_name" {
  description = "Managed identity name for NetApp"
  default     = "lnmi" # Learner NetApp Managed Identity
}

variable "netapp_account_name" {
  description = "NetApp account name"
  default     = "learner-netapp-account"
}

variable "active_directory" {
  description = "Active Directory configuration for NetApp"
  type = object({
    username = string
    password = string
    domain   = string
    dns      = list(string)
  })
  default = {
    username = "learneraduser"
    password = "Adm1n!$trator"
    domain   = "learnerad.domain"
    dns      = ["1.2.3.4"]
  }
}

variable "capacity_pool_name" {
  description = "Name of the NetApp capacity pool"
  default     = "learner-capacity-pool"
}

variable "azurerm_netapp_volume_name" {
  description = "Name of the NetApp volume"
  default     = "learner-netapp-volume"
}

variable "protocol" {
  description = "Protocols for the NetApp volume"
  type        = list(string)
  default     = ["NFSv4.1"]
}


## Backup vault & policy
variable "backup_policy" {
  description = "Name of the Azure NetApp Files account"
  type        = string
}

variable "backup_vault" {
  description = "Name of the Azure NetApp Files account"
  type        = string
}


## Backup quotas & frequency
variable "daily_backup" {
  description = "Quota for the NetApp volume in GB"
  type        = number
  default     = 20
}

variable "monthly_backup" {
  description = "Quota for the NetApp volume in GB"
  type        = number
  default     = 20
}

variable "weekly_backup" {
  description = "Quota for the NetApp volume in GB"
  type        = number
  default     = 20
}

variable "netapp_vnet_name" {
  description = "Name of the virtual network for NetApp"
  default     = "netapp-vnet"
}

variable "netapp_subnet_name" {
  description = "Name of the subnet for NetApp"
  default     = "netapp-subnet"
}