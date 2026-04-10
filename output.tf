# ==========================================
# RESOURCE GROUP
# ==========================================
output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = local.rg_name
}

output "resource_group_location" {
  description = "Location of the Resource Group"
  value       = local.rg_location
}

# ==========================================
# NETWORK
# ==========================================
output "vnet_name" {
  description = "Virtual Network Name"
  value       = local.vnet_name
}

output "subnet_id" {
  description = "Subnet ID"
  value       = local.subnet_id
}

# ==========================================
# NSG
# ==========================================
output "nsg_id" {
  description = "Network Security Group ID"
  value       = local.nsg_id
}

output "nsg_name" {
  description = "Network Security Group Name"
  value       = local.nsg_name
}

# ==========================================
# PUBLIC IP
# ==========================================
output "public_ip_id" {
  description = "Public IP ID"
  value       = var.public_ip_required == "true" ? azurerm_public_ip.pip[0].id : null
}

output "public_ip_address" {
  description = "Public IP Address"
  value       = var.public_ip_required == "true" ? azurerm_public_ip.pip[0].ip_address : null
}

# ==========================================
# NETWORK INTERFACE
# ==========================================
output "nic_id" {
  description = "Network Interface ID"
  value       = local.nic_id
}

# ==========================================
# VIRTUAL MACHINE
# ==========================================
output "vm_id" {
  description = "Virtual Machine ID"
  value       = azurerm_virtual_machine.vm.id
}

output "vm_name" {
  description = "Virtual Machine Name"
  value       = azurerm_virtual_machine.vm.name
}

output "vm_location" {
  description = "VM Location"
  value       = azurerm_virtual_machine.vm.location
}

output "vm_size" {
  description = "VM Size"
  value       = azurerm_virtual_machine.vm.vm_size
}

# ==========================================
# IMAGE DETAILS
# ==========================================
output "image_id" {
  description = "Custom Image ID used for VM"
  value       = data.azurerm_shared_image_version.custom.id
}