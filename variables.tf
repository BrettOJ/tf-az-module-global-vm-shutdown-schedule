variable "location" {
  description = "The location/region where the resources will be created"
  type        = string
}

variable "virtual_machine_id" {
  description = "The resource ID of the target ARM-based Virtual Machine"
  type        = string
}

variable "enabled" {
  description = "Whether to enable the schedule"
  type        = bool
  default     = true
}

variable "timezone" {
  description = "The time zone ID (e.g. Pacific Standard time)"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(any)
}

variable "daily_recurrence_time" {
  description = "The time each day when the schedule takes effect"
  type        = string
}

variable "notification_settings" {
  description = "The notification setting of a schedule"
  type = object({
    enabled         = bool
    email           = string
    time_in_minutes = string
    webhook_url     = string
  })
}

