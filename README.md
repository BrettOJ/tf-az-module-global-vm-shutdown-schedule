# tf-az-module-global-vm-shutdown-schedule
Terraform module to shutdown standard VM's in Azure 



Manages automated shutdown schedules for Azure VMs that are not within an Azure DevTest Lab. While this is part of the DevTest Labs service in Azure, this resource applies only to standard VMs, not DevTest Lab VMs. To manage automated shutdown schedules for DevTest Lab VMs, reference the [`azurerm_dev_test_schedule` resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_schedule)

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#example-usage)

```hcl
resource "azurerm_resource_group" "example" { name = "sample-rg" location = "West Europe" } resource "azurerm_virtual_network" "example" { name = "sample-vnet" address_space = ["10.0.0.0/16"] location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name } resource "azurerm_subnet" "example" { name = "sample-subnet" resource_group_name = azurerm_resource_group.example.name virtual_network_name = azurerm_virtual_network.example.name address_prefixes = ["10.0.2.0/24"] } resource "azurerm_network_interface" "example" { name = "sample-nic" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name ip_configuration { name = "testconfiguration1" subnet_id = azurerm_subnet.example.id private_ip_address_allocation = "Dynamic" } } resource "azurerm_linux_virtual_machine" "example" { name = "SampleVM" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name network_interface_ids = [azurerm_network_interface.example.id] size = "Standard_B2s" source_image_reference { publisher = "Canonical" offer = "0001-com-ubuntu-server-jammy" sku = "22_04-lts" version = "latest" } os_disk { name = "myosdisk-example" caching = "ReadWrite" storage_account_type = "Standard_LRS" } admin_username = "testadmin" admin_password = "Password1234!" disable_password_authentication = false } resource "azurerm_dev_test_global_vm_shutdown_schedule" "example" { virtual_machine_id = azurerm_linux_virtual_machine.example.id location = azurerm_resource_group.example.location enabled = true daily_recurrence_time = "1100" timezone = "Pacific Standard Time" notification_settings { enabled = true time_in_minutes = "60" webhook_url = "https://sample-webhook-url.example.com" } }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#argument-reference)

The following arguments are supported:

-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#location-1) - (Required) The location where the schedule is created. Changing this forces a new resource to be created.
    
-   [`virtual_machine_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#virtual_machine_id-1) - (Required) The resource ID of the target ARM-based Virtual Machine. Changing this forces a new resource to be created.
    
-   [`enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#enabled-1) - (Optional) Whether to enable the schedule. Possible values are `true` and `false`. Defaults to `true`.
    
-   [`timezone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#timezone-1) - (Required) The time zone ID (e.g. Pacific Standard time). Refer to this guide for a [full list of accepted time zone names](https://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/).
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#tags-1) - (Optional) A mapping of tags to assign to the resource.
    
-   [`daily_recurrence_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#daily_recurrence_time-1) - (Required) The time each day when the schedule takes effect. Must match the format HHmm where HH is 00-23 and mm is 00-59 (e.g. 0930, 2300, etc.)
    
-   [`notification_settings`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#notification_settings-1) - (Required) The notification setting of a schedule. A `notification_settings` block as defined below.
    

___

A `notification_settings` block supports the following:

-   [`enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#enabled-2) - (Required) Whether to enable pre-shutdown notifications. Possible values are `true` and `false`.
    
-   [`email`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#email-1) - (Optional) E-mail address to which the notification will be sent.
    
-   [`time_in_minutes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#time_in_minutes-1) - (Optional) Time in minutes between 15 and 120 before a shutdown event at which a notification will be sent. Defaults to `30`.
    
-   [`webhook_url`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#webhook_url-1) - (Optional) The webhook URL to which the notification will be sent.
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#attributes-reference)

The following additional attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#id-1) - The Dev Test Global Schedule ID.

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#read-1) - (Defaults to 5 minutes) Used when retrieving the Dev Test Global Vm Shutdown Schedule.
-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#create-1) - (Defaults to 30 minutes) Used when creating the Dev Test Global Vm Shutdown Schedule.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#update-1) - (Defaults to 30 minutes) Used when updating the Dev Test Global Vm Shutdown Schedule.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#delete-1) - (Defaults to 30 minutes) Used when deleting the Dev Test Global Vm Shutdown Schedule.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule#import)

An existing Dev Test Global Shutdown Schedule can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_dev_test_global_vm_shutdown_schedule.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sample-rg/providers/Microsoft.DevTestLab/schedules/shutdown-computevm-SampleVM
```

The name of the resource within the `resource id` will always follow the format `shutdown-computevm-<VM Name>` where `<VM Name>` is replaced by the name of the target Virtual Machine