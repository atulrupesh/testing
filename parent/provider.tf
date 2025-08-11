terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = ">= 4.0"
        }
    }
    
}

provider "azurerm" {
  features {}
  subscription_id = "2e17b720-9814-4b02-a2fb-867235e91256"
}




# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "4.37.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}


#   subscription_id = "2e17b720-9814-4b02-a2fb-867235e91256"

# }

