variable "token" {
  type = string
  sensitive = true
  description = "The token used for Github API"
}

variable "Users" {
  type = list(string)
  default = [ "cotsiosglad", "andreas203" ]
}