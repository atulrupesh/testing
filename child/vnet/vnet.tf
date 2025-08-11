resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet-name
  location            = var.location
  resource_group_name = var.rg-name
  address_space       = var.vnet_address_space
}


