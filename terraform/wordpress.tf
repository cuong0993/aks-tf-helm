resource "helm_release" "wordpress" {
  name       = "wordpresssite"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  version = "~>16.1.0"
    values = [
    "${file("values.yaml")}"
  ]

  # set {
  #   name  = "wordpressBlogName"
  #   value = "${var.wp_site_name}"
  # }
  # set {
  #   name  = "wordpressUsername"
  #   value = "${var.wp_username}"
  # }
  # set_sensitive {
  #   name  = "wordpressPassword"
  #   value = "${var.wp_username}"
  # }

  depends_on = [
    azurerm_kubernetes_cluster.example
    ]
}