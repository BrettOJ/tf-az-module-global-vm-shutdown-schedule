

# Variables file for an azure linux virtual machine

variable "location" {
  type        = string
  description = "The Azure location where the Linux Virtual Machine should exist."
  default     = "southeastasia"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which the Linux Virtual Machine should be exist. Changing this forces a new resource to be created."
}

variable "admin_username" {
  type        = string
  description = "The Username which should be used for the Virtual Machine."
}

variable "admin_password" {
  type        = string
  description = "The Password which should be used for the local-administrator on this Virtual Machine."
}

variable "size" {
  type        = string
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
}

variable "allow_extension_operations" {
  type        = bool
  description = "Should Extension Operations be allowed on this Virtual Machine? Defaults to true."
}

variable "availability_set_id" {
  type        = string
  description = "Specifies the ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created."
}

variable "boot_diagnostics_storage_account_uri" {
  type        = string
  description = "The URI of the Storage Account which should be used for Boot Diagnostics. Changing this forces a new resource to be created."
}

variable "bypass_platform_safety_checks_on_user_schedule_enabled" {
  type        = bool
  description = "Specifies whether to skip platform scheduled patching when a user schedule is associated with the VM. Defaults to false."
}

variable "capacity_reservation_group_id" {
  type        = string
  description = "Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to."
}

variable "computer_name" {
  type        = string
  description = "Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name. Changing this forces a new resource to be created."
}

variable "custom_data" {
  type        = string
  description = "The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created."
}

variable "dedicated_host_id" {
  type        = string
  description = "The ID of a Dedicated Host where this machine should be run on. Conflicts with dedicated_host_group_id."
}

variable "dedicated_host_group_id" {
  type        = string
  description = "The ID of a Dedicated Host Group that this Linux Virtual Machine should be run within. Conflicts with dedicated_host_id."
}

variable "disable_password_authentication" {
  type        = bool
  description = "Should Password Authentication be disabled on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
}

variable "disk_controller_type" {
  type        = string
  description = "(Optional) Specifies the Disk Controller Type used for this Virtual Machine. Possible values are SCSI and NVMe."
}

variable "edge_zone" {
  type        = string
  description = "Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created."
}

variable "encryption_at_host_enabled" {
  type        = bool
  description = "Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
}

variable "eviction_policy" {
  type        = string
  description = "Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. Possible values are Deallocate and Delete. Changing this forces a new resource to be created."
}

variable "extensions_time_budget" {
  type        = string
  description = "Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to PT1H30M."
}


variable "gallery_application_version_id" {
  type        = string
  description = "One or more gallery_application blocks as defined below."
}

variable "gallery_application_automatic_upgrade_enabled" {
  type        = bool
  description = "Specifies whether automatic upgrades should be enabled for the gallery application. Defaults to false."
}

variable "gallery_application_configuration_blob_uri" {
  type        = string
  description = "Specifies the URI of the configuration blob for the gallery application."
}

variable "gallery_application_order" {
  type        = number
  description = "Specifies the order of the gallery application."
}

variable "gallery_application_tag" {
  type        = string
  description = "Specifies the tags for the gallery application."
}

variable "gallery_application_treat_failure_as_deployment_failure_enabled" {
  type        = bool
  description = "Specifies whether to treat a failure of the gallery application as a deployment failure. Defaults to false."
}

variable "identity_type" {
  type        = string
  description = "The type of Managed Service Identity which should be used for this Virtual Machine. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned."
}

variable "identity_identity_ids" {
  type        = list(string)
  description = "A list of User Assigned Managed Service Identity IDs which should be associated with this Virtual Machine."
}

variable "patch_assessment_mode" {
  type        = string
  description = "Specifies the mode of VM Guest Patching for the Virtual Machine. Possible values are AutomaticByPlatform or ImageDefault. Defaults to ImageDefault."
}

variable "patch_mode" {
  type        = string
  description = "Specifies the mode of in-guest patching to this Linux Virtual Machine. Possible values are AutomaticByPlatform and ImageDefault. Defaults to ImageDefault. For more information on patch modes please see the product documentation."
}

variable "max_bid_price" {
  type        = number
  description = "The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons."
}

variable "plan_name" {
  type        = string
  description = "A plan block as defined below. Changing this forces a new resource to be created."
}

variable "plan_product" {
  type        = string
  description = "The Product which should be used for this Virtual Machine."
}

variable "plan_publisher" {
  type        = string
  description = "The Publisher which should be used for this Virtual Machine."
}

variable "platform_fault_domain" {
  type        = number
  description = "Specifies the Platform Fault Domain in which this Linux Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Linux Virtual Machine to be created."
}

variable "priority" {
  type        = string
  description = "Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created."
}

variable "provision_vm_agent" {
  type        = bool
  description = "Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
}


variable "proximity_placement_group_id" {
  type        = string
  description = "The ID of the Proximity Placement Group which the Virtual Machine should be assigned to."
}

variable "reboot_setting" {
  type        = string
  description = "Specifies the reboot setting for platform scheduled patching. Possible values are Always, IfRequired and Never."
}


variable "secure_boot_enabled" {
  type        = bool
  description = "Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created."
}

variable "os_image_notification_timeout" {
  type        = string
  description = "A os_image_notification block as defined below."
}

variable "termination_notification" {
  type = object({
    enabled = bool
    timeout = string
  })
  description = "A termination_notification block as defined below."
  default = {
    enabled = false
    timeout = null
  }
}

variable "user_data" {
  type        = string
  description = "The Base64-Encoded User Data which should be used for this Virtual Machine."
}

variable "vm_agent_platform_updates_enabled" {
  type        = bool
  description = "Specifies whether VMAgent Platform Updates is enabled. Defaults to false."
}

variable "vtpm_enabled" {
  type        = bool
  description = "Specifies whether vTPM should be enabled on the virtual machine. Changing this forces a new resource to be created."
}

variable "virtual_machine_scale_set_id" {
  type        = string
  description = "Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within."
}

variable "secret_certificate_url" {
  type        = string
  description = "The URL of the certificate that should be used to encrypt the secret. Changing this forces a new resource to be created."
  default     = null
}

variable "secret_key_vault_id" {
  type        = string
  description = "The ID of the Key Vault that should be used to encrypt the secret. Changing this forces a new resource to be created."
  default     = null
}

variable "admin_ssh_key_public_key" {
  type        = string
  description = "The public key of the SSH key pair that should be used to authenticate to the Virtual Machine. Changing this forces a new resource to be created."
}

variable "admin_ssh_key_username" {
  type        = string
  description = "The username of the SSH key pair that should be used to authenticate to the Virtual Machine. Changing this forces a new resource to be created."

}
variable "public_integration_snet_name" {
  type        = string
  description = "The name of the subnet that is used for the public integration."
}


variable "source_image_reference_version" {
  type        = string
  description = "The version of the source image to use for the virtual machine."
}

variable "source_image_reference_offer" {
  type        = string
  description = "The offer of the source image to use for the virtual machine."
}

variable "source_image_reference_publisher" {
  type        = string
  description = "The publisher of the source image to use for the virtual machine."
}

variable "source_image_reference_sku" {
  type        = string
  description = "The SKU of the source image to use for the virtual machine."
}

variable "dns_servers" {
  type        = list(string)
  description = "The DNS servers that should be used for the virtual network."

}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network."

}

variable "create_nsg" {
  type        = bool
  description = "Should a Network Security Group be created for the Virtual Network? Defaults to true."

}

variable "source_image_id" {
  type        = string
  description = "The ID of the source image to use for the virtual machine."
  default     = null
}

variable "os_disk_storage_account_type" {
  type        = string
  description = "The Storage Account Type which should be used for the OS Disk. Changing this forces a new resource to be created."
  default     = "Standard_LRS"
}

variable "os_disk_caching" {
  type        = string
  description = "The Caching which should be used for the OS Disk. Changing this forces a new resource to be created."
  default     = "ReadWrite"
}

variable "zone" {
  type        = string
  description = "The Availability Zone which should be used for this Virtual Machine. Changing this forces a new resource to be created."
  
}