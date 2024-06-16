variable "subscription_id" {
  sensitive   = true
  default     = "notset"
  description = "Azure subscription_id"

}

variable "client_id" {
  sensitive   = true
  default     = "changeMe"
  description = "Azure client_id"
}

variable "client_secret" {
  sensitive   = true
  default     = "changeMe"
  description = "Azure client_secret"
}

variable "tenant_id" {
  description = "Azure tenant_id"
}

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