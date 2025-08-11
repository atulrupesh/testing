data "azurerm_subnet" "subnet" {
    name = var.subnet-name
    virtual_network_name = var.vnet-name
    resource_group_name = var.rg-name
}

data "azurerm_public_ip" "public_ip" {
  name                = var.pip-name
  resource_group_name = var.rg-name
}


data "azurerm_key_vault" "kv" {
  name                = var.kv-name
  resource_group_name = var.kv-rg-name
}


data "azurerm_key_vault_secret" "kv-username" {
  name =  var.kv-secret-username
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "kv-password" {
  name =  var.kv-secret-password
  key_vault_id = data.azurerm_key_vault.kv.id
}