resource "helm_release" "wordpress" {
  name       = "wordpresssite"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  version = "~>16.1.0"
    values = [
    "${file("values.yaml")}"
  ]

  depends_on = [
    azurerm_kubernetes_cluster.example
    ]
}