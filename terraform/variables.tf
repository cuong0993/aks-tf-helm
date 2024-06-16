variable "deploymentName" {
  type        = string
  description = "AKS deployment name"
  default     = "dev-deployment"
}

variable "wp_site_name" {
  type        = string
  description = "Wordpress site name"
  default     = "WP_devel_site"
}

variable "wp_username" {
  type        = string
  description = "WP admin username"
  default     = "admin"
}

variable "wp_password" {
  type        = string
  sensitive   = true
  description = "WP admin password"
  default     = "StewPidSimp1e"
}