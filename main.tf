terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 1.22"
    }
  }
}

resource "random_string" "random" {
  length  = 12
  special = false
}

resource "grafana_dashboard" "web_stats_dashboard" {
  folder = var.folder_id

  config_json = templatefile(
    "${path.module}/dashboards/web.json",
    {
      ENVIRONMENT_REPLACE     = var.environment,
      NOTIFICATION_REPLACE    = var.notification_channel
      PRODUCT_REPLACE         = var.product_name
      LOKI_DATASOURCE_REPLACE = var.loki_datasource,
      SERVICE_REPLACE         = var.service_name
      UID_REPLACE             = random_string.random.result
      APP_NAME                = var.app_name
    }
  )
}

resource "grafana_dashboard" "web_logs_dashboard" {
  folder = var.folder_id

  config_json = templatefile(
    "${path.module}/dashboards/logs.json",
    {
      ENVIRONMENT_REPLACE     = var.environment,
      NOTIFICATION_REPLACE    = var.notification_channel
      PRODUCT_REPLACE         = var.product_name
      LOKI_DATASOURCE_REPLACE = var.loki_datasource,
      SERVICE_REPLACE         = var.service_name
      UID_REPLACE             = random_string.random.result
      APP_NAME                = var.app_name
    }
  )
}
