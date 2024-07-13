variable "network" {
type = map(object({
    nsg_name = string
    subnets = list(object({
      name = string
      address_prefix = string
    }))
}))
default = {
    dev  =  {
        nsg_name  = "devNSG",
        subnets = [
            {
            name  = "dev-subnet1"
            address_prefix =  "10.0.1.0/24"
            },
            {
            name  = "dev-subnet2"
            address_prefix =  "10.0.2.0/24"
            }]
        },
    test=  {
        nsg_name  = "testNSG",
        subnets = [
            {
            name  = "test-subnet1"
            address_prefix =  "10.1.1.0/24"
            },
            {
            name  = "test-subnet2"
            address_prefix =  "10.1.2.0/24"
            }]
        },
    prod=  {
        nsg_name  = "prodNSG",
        subnets = [
            {
            name  = "prod-subnet1"
            address_prefix =  "10.2.1.0/24"
            },
            {
            name  = "prod-subnet2"
            address_prefix =  "10.2.2.0/24"
            }]
        }
    }
}

