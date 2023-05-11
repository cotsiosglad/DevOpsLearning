source "azure-arm" "autogenerated_1" {
  azure_tags = {
    dept = "DevOps"
    task = "Image deployment"
  }
  client_id                         = "3b0e264a-8a5c-4753-80a1-3cab4aa7578c"
  client_secret                     = "PNN8Q~RYGVmvYKdMe3CzVCIeLxf8khji-xe.ga-A"
  image_offer                       = "0001-com-ubuntu-server-jammy"
  image_publisher                   = "Canonical"
  image_sku                         = "22_04-lts-gen2"
  location                          = "West Europe"
  managed_image_name                = "myAZPackerImage"
  managed_image_resource_group_name = "myResourceGroup"
  os_type                           = "Linux"
  subscription_id                   = "207eb854-a22d-4398-b63e-f09452a3eb64"
  tenant_id                         = "fcd0be7c-4ee7-47c4-9299-288e7477e4ef"
  vm_size                           = "Standard_B2s"
}
# az vm create --resource-group myResourceGroup --name myVM --image myAZPackerImage --admin-username allenex --admin-password Skasemalaka1! --generate-ssh-keys
build {
  sources = ["source.azure-arm.autogenerated_1"]

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline          = ["apt-get update", "apt-get upgrade -y", "apt-get -y install nginx", "/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"]
    inline_shebang  = "/bin/sh -x"
  }

}


