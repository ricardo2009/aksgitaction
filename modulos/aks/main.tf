provider "azurerm" {}

module "rg" {
  source = "../rg"

  rg_name     = var.rg_name
  location    = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = module.rg.location
  resource_group_name = module.rg.name

  default_node_pool {
    name            = var.default_node_pool_name
    node_count      = var.default_node_pool_node_count
    vm_size         = var.default_node_pool_vm_size
    os_disk_size_gb = var.default_node_pool_os_disk_size_gb
  }
}
