variable "folder_id" {
  description = "Grafana Folder ID"
  type        = string
}

variable "app_name" {
  description = "Application Name"
  type        = string
  default     = "nginx-ingress-controller"
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "product_name" {
  description = "Product Name"
  type        = string
}

variable "notification_channel" {
  description = "Notification Channel"
  type        = string
}

variable "service_name" {
  description = "Service Name"
  type        = string
}

variable "loki_datasource" {
  description = "Loki Datasource"
  type        = string
}
