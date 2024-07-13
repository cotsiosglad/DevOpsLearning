terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.2"
    }
  }
}

provider "null" {}

resource "null_resource" "name" {
  for_each = var.instanceMap

  provisioner "local-exec" {
    command = "echo ${each.value}"
  }
}

output "instanceMapOutput" {
  value = "The output of the variable is : ${var.instanceMap["name"]}"
}