terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "random_id" "server" {

  byte_length = 4
}

resource "azurerm_resource_group" "example" {
  name     = "RG-${var.deploymentName}-${random_id.server.dec}"
  location = "westus2"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "AKS-${var.deploymentName}-${random_id.server.dec}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "AKS-${var.deploymentName}-${random_id.server.dec}"
  kubernetes_version  = "1.29.4"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                        = "default"
    node_count                  = 1
    vm_size                     = "Standard_B2pls_v2"
    temporary_name_for_rotation = "tmpnppool01"
  }

}

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.example]
  filename   = "./kubeconfig"
  content    = azurerm_kubernetes_cluster.example.kube_config_raw
}
