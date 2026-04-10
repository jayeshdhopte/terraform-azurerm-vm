# Terraform Azure VM Module

This module provisions an Azure Virtual Machine using a **custom image** along with:
- Resource Group (new or existing)
- Virtual Network (new or existing)
- Subnet (new or existing)
- Network Security Group (new or existing)
- Public IP (optional)
- Network Interface

Supports flexible deployment using conditional logic.

---

```hcl
module "vm" {
  source  = "app.terraform.io/<org>/vm/azurerm"
  version = "1.0.0"

  # Resource Group
  rg_choice              = "new"
  resource_group         = "rg-demo"
  resource_group_region  = "East US"

  # VNet
  vnet_choice            = "new"
  virtual_network_name   = "vnet-demo"
  vnet_address_prefix    = "10.0.0.0/16"

  # Subnet
  subnet_choice          = "new"
  subnet_name            = "subnet-demo"
  subnet_address_prefix  = "10.0.1.0/24"

  # NSG
  nsg_choice             = "new"
  nsg_name               = "nsg-demo"

  rule_name              = "allow-ssh"
  rule_priority          = 100
  rule_direction         = "Inbound"
  rule_access            = "Allow"
  rule_protocol          = "Tcp"
  source_port_range      = "*"
  destination_port_range = "22"
  nsg_source_address_prefix = "*"
  nsg_destination_address_prefix = "*"

  # Image
  shared_image_version   = "0.0.1"
  image_definition_name  = "goldenimage"
  shared_gallery         = "gallery"

  # NIC & Public IP
  nic_choice             = "new"
  nic_name               = "nic-demo"
  ip_config_name         = "ipconfig1"
  private_ip_allocation  = "Dynamic"

  public_ip_required     = "true"

  # VM
  virtual_machine_name   = "vm-demo"
  vm_size                = "Standard_B2s"

  os_disk_caching        = "ReadWrite"
  os_storage_account_type = "Standard_LRS"
}