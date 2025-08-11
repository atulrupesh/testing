module "RG" {
  source = "../child/rg"
  rg-name = "cc-rg"
  location = "East US"
}

module "VNET" {
  source = "../child/vnet"
  vnet-name = "cc-vnet"
  rg-name = "cc-rg"
  location = "East US"
  vnet_address_space = ["10.0.0.0/16"]
  depends_on = [ module.RG ]
}

module "SUBNET" {
  source = "../child/subnet"
  subnet-name = "cc-subnet"
  rg-name = "cc-rg"
  vnet-name = "cc-vnet"
  address_prefixes = ["10.0.1.0/24"]
  depends_on = [ module.VNET ]
}


module "Public_IP" {
  source = "../child/public_ip"
  pip-name = "cc-public-ip"
  rg-name = "cc-rg"
  location = "East US"
  allocation_method = "Static"
  depends_on = [ module.RG ]
}



module "VM" {
  source = "../child/vm"
  nic-name = "cc-nic"
  location = "East US"
  rg-name = "cc-rg"
  vm-name = "cc-vm"
  vm-size = "Standard_F2"
  vm-storage_account_type = "Standard_LRS"
  vm-sku = "22_04-lts"
  subnet-name = "cc-subnet"
  vnet-name = "cc-vnet"
  pip-name = "cc-public-ip"
  kv-name = "tijori"
  kv-rg-name = "keyvault-rg"
  kv-secret-username = "username"
  kv-secret-password = "password"
  depends_on = [module.SUBNET, module.Public_IP ]
}


