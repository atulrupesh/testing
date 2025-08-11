resource "azurerm_public_ip" "public_ip" {
  name                = var.pip-name
  resource_group_name = var.rg-name
  location            = var.location
  allocation_method   = var.allocation_method
}

