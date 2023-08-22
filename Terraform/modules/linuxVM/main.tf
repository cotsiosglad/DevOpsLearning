terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.64.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

resource "random_string" "random" {
  length           = 4
  special          = false
  upper = false
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = "West Europe"
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "my_storage_account" {
  name                     = "storagetest${random_string.random.result}"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = "myVM${count.index}"
  count = 2
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "Allenrkiou"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  }
}


variable "servers" {
  type = map(object({
    cpu = number
    memory = number
    instances = number
    disk = map(object({
      size_gb = number
      storage_account_type = string
    }))
  }))
  default = {
    "disk" = {
      disk1 = {
        size_gb = 100
        storage_account_type = "Standard_LRS"
      },
      disk2 = {
        size_gb = 100
        storage_account_type = "Standard_LRS"
      },
      disk3 = {
        size_gb = 100
        storage_account_type = "Standard_LRS"
      }
}
  }
}



local {
  instantdiskmap = {for k in range(var.instances): {for i in length(1,disk : {
  disk+i = disk
  })}}
}

resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = "myVM${count.index}"
  count = var.instances
}
resource "azurerm_managed_disk" "data_disk"{
  for_each = var.disk
  name = each.key
  storage_account_type = each.value.storage_account_type
  disk_size_gb = each.value.size_gb
}
{for k in range(var.instances): {for i in length(disk : {
  disk+i = disk
  })}}
