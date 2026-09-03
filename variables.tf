variable "admin_ip" {
  description = "Public IPv4 address allowed to SSH to bastion"
  type        = string
}

variable "domain_name" {
  description = "Root domain name"
  type        = string
}

variable "app_subdomain" {
  description = "Application subdomain"
  type        = string
  default     = "app"
}