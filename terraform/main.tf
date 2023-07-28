terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "__tfstateresourcegroupname__"
    storage_account_name = "__tfstatestorageaccountname__"
    container_name       = "__tfstatecontainername__"
    key                  = "__tfstatekey__"
    }
}

provider "azurerm" {
  features {}
  # use_msi = true
  subscription_id   = "${var.subscription_id}"
  tenant_id         = "${var.tenant_id}"
  client_id         = "${var.client_id}" # App ID
  client_secret     = "${var.client_secret}" # Value
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

  service_principal {
    client_id     = "${var.client_id}" # AppId
    client_secret = "${var.client_secret}" # Value
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.example]
  filename     = "./kubeconfig"
  content      = azurerm_kubernetes_cluster.example.kube_config_raw
}
