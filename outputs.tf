output "resource_group_id" {
description = "The ID of the resource group"
value       = azurerm_resource_group.rg.id
}

output "resource_group_name" {
description = "The name of the resource group"
value       = azurerm_resource_group.rg.name
}

output "vnet_id" {
description = "The ID of the virtual network"
value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
description = "The ID of the subnet"
value       = azurerm_subnet.subnet.id
}

output "network_interface_id" {
description = "The ID of the network interface"
value       = azurerm_network_interface.nic.id
}

output "vm_id" {
description = "The ID of the Windows virtual machine"
value       = azurerm_windows_virtual_machine.vm.id
}

output "vm_name" {
description = "The name of the Windows virtual machine"
value       = azurerm_windows_virtual_machine.vm.name
}

output "storage_account_name" {
description = "The name of the storage account"
value       = azurerm_storage_account.sa.name
}

output "storage_account_id" {
description = "The ID of the storage account"
value       = azurerm_storage_account.sa.id
}

############################

# NetApp Outputs

############################

output "netapp_resource_group_name" {
description = "The name of the NetApp resource group"
value       = azurerm_resource_group.netapp_rg.name
}

output "netapp_account_name" {
description = "The name of the NetApp account"
value       = azurerm_netapp_account.netapp_account.name
}

output "netapp_pool_name" {
description = "The NetApp capacity pool name"
value       = azurerm_netapp_pool.capacity_pool.name
}

output "netapp_volume_name" {
description = "The NetApp volume name"
value       = azurerm_netapp_volume.netappvolume.name
}

output "netapp_volume_id" {
description = "The NetApp volume ID"
value       = azurerm_netapp_volume.netappvolume.id
}

output "netapp_backup_policy_name" {
description = "NetApp backup policy name"
value       = azurerm_netapp_backup_policy.weekly_backup.name
}

output "netapp_backup_vault_name" {
description = "NetApp backup vault name"
value       = azurerm_netapp_backup_vault.learners_backup_vault.name
}
