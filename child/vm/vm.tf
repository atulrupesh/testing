resource "azurerm_network_interface" "nic" {
  name                = var.nic-name
  location            = var.location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id =      data.azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm-name
  resource_group_name = var.rg-name
  location            = var.location
  size                = var.vm-size
  admin_username      = data.azurerm_key_vault_secret.kv-username.value
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_password = data.azurerm_key_vault_secret.kv-password.value
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vm-storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = var.vm-sku
    version   = "latest"
  }
}




