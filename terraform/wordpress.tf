resource "helm_release" "wordpress" {
  name = "wordpresssite"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  version    = "22.4.10"
  values = [
    "${file("values.yaml")}"
  ]

  depends_on = [
    azurerm_kubernetes_cluster.example
  ]
}