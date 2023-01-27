provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
count = length(var.resource_group)
name = var.resource_group[count.index].name
location = var.resource_group[count.index].location
tags = {
method = "iac-terraform"
env = "dev"
}
}

variable "resource_group" {
description = "Name of the Azure Resource Group"
type = list(map(string))
}

# Output id resource group
output "resource_group_id" {
value = azurerm_resource_group.rg.*.id
}