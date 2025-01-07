
resource "azurerm_dev_test_global_vm_shutdown_schedule" "shutdown_schedule" {
  virtual_machine_id    = var.virtual_machine_id
  location              = var.location
  enabled               = var.enabled
  daily_recurrence_time = var.daily_recurrence_time
  timezone              = var.timezone
  tags                  = var.tags

  notification_settings {
    enabled         = var.notification_settings.enabled
    email           = var.notification_settings.email
    time_in_minutes = var.notification_settings.time_in_minutes
    webhook_url     = var.notification_settings.webhook_url
  }
}