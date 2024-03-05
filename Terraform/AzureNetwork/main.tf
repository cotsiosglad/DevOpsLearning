terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
}


resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# resource "azurerm_network_security_group" "example" {
#   name                = "example-security-group"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_subnet" "example" {
#   for_each = local.mapSubnet
#   name                 = [ for k,v in each.value : v.name]
#   resource_group_name  = azurerm_resource_group.
#   virtual_network_name = [ for k,v in each.value : ]
#   address_prefixes     = [ for k,v in each.value : v.address_prefix]
# }

# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   tags = {
#     environment = "Production"
#   }
# }

