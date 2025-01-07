locals {
  naming_convention_info = {
    site        = "site"
    env         = "env"
    app         = "app"
    name        = "name"
  }
  tags = {
    environment = "Production"
  }
}
module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name     = var.resource_group_name
      location = var.location
      naming_convention_info = local.naming_convention_info
      tags = {
      }
    }
  }
}

module "azure_virtual_network" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-virtual-network?ref=main"
  location               = var.location
  resource_group_name    = module.resource_groups.rg_output[1].name
  address_space          = var.address_space
  dns_servers            = var.dns_servers
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags

}

module "azure_subnet" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-network-subnet?ref=main"
  resource_group_name    = module.resource_groups.rg_output[1].name
  virtual_network_name   = module.azure_virtual_network.vnets_output.name
  location               = var.location
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags
  create_nsg             = var.create_nsg
  subnets = {
    001 = {
      address_prefixes                          = ["10.0.1.0/24"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = null
      route_table_id                            = null
      delegation                                = null
      nsg_inbound                               = []
      nsg_outbound                              = []
    }
  }
}

module "nic_obj" {
  source              = "git::https://github.com/BrettOJ/tf-az-module-network-interface?ref=main"
  location            = var.location
  resource_group_name = module.resource_groups.rg_output.1.name
  subnet_id           = module.azure_subnet.snet_output.001.id
  instances = {
    nic1 = {
      index = 1
      ip_config = {
        n1 = {
          is_primary           = true
          public_ip_address_id = null
          private_ip_address   = null
          enable_ip_forwarding = false
        }
      }
    }
  }
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags
}

module "azurerm_linux_virtual_machine" {
  source                                                 = "git::https://github.com/BrettOJ/tf-az-module-linux-virtual-machine?ref=main"
  location                                               = var.location
  resource_group_name                                    = module.resource_groups.rg_output.1.name
  size                                                   = "Standard_F2"
  admin_username                                         = "adminuser"
  admin_password                                         = var.admin_password
  network_interface_ids                                  = [module.nic_obj.nic_output.nic1.id]
  disable_password_authentication                        = false
  allow_extension_operations                             = var.allow_extension_operations
  availability_set_id                                    = var.availability_set_id
  bypass_platform_safety_checks_on_user_schedule_enabled = var.bypass_platform_safety_checks_on_user_schedule_enabled
  capacity_reservation_group_id                          = var.capacity_reservation_group_id
  computer_name                                          = var.computer_name
  custom_data                                            = var.custom_data
  dedicated_host_id                                      = var.dedicated_host_id
  dedicated_host_group_id                                = var.dedicated_host_group_id
  disk_controller_type                                   = var.disk_controller_type
  edge_zone                                              = var.edge_zone
  encryption_at_host_enabled                             = var.encryption_at_host_enabled
  eviction_policy                                        = var.eviction_policy
  extensions_time_budget                                 = var.extensions_time_budget
  patch_assessment_mode                                  = var.patch_assessment_mode
  patch_mode                                             = var.patch_mode
  max_bid_price                                          = var.max_bid_price
  platform_fault_domain                                  = var.platform_fault_domain
  priority                                               = var.priority
  provision_vm_agent                                     = var.provision_vm_agent
  proximity_placement_group_id                           = var.proximity_placement_group_id
  reboot_setting                                         = var.reboot_setting
  secure_boot_enabled                                    = var.secure_boot_enabled
  user_data                                              = var.user_data
  vm_agent_platform_updates_enabled                      = var.vm_agent_platform_updates_enabled
  vtpm_enabled                                           = var.vtpm_enabled
  virtual_machine_scale_set_id                           = var.virtual_machine_scale_set_id
    zone                                                   = var.zone
  naming_convention_info                                 = local.naming_convention_info
  tags                                                   = local.tags

  source_image_id = var.source_image_id
  source_image_reference = {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }

  os_disk = {
    storage_account_type = var.os_disk_storage_account_type
    caching              = var.os_disk_caching
  }

  boot_diagnostics = {
    storage_account_uri = var.boot_diagnostics_storage_account_uri
  }

  identity = {
    type         = var.identity_type
    identity_ids = var.identity_identity_ids
  }

  additional_capabilities = {
    ultra_ssd_enabled   = false
    hibernation_enabled = false

  }
  os_image_notification = {
    timeout = var.os_image_notification_timeout
  }

  termination_notification = {
    enabled = false
    timeout = null
  }

  secret = {
    certificate = {
      url = var.secret_certificate_url
    }
    key_vault_id = var.secret_key_vault_id
  }

  gallery_application = {
    version_id                                  = var.gallery_application_version_id
    automatic_upgrade_enabled                   = var.gallery_application_automatic_upgrade_enabled
    configuration_blob_uri                      = var.gallery_application_configuration_blob_uri
    order                                       = var.gallery_application_order
    tag                                         = var.gallery_application_tag
    treat_failure_as_deployment_failure_enabled = var.gallery_application_treat_failure_as_deployment_failure_enabled
  }

    plan = {
        name      = var.plan_name
        product   = var.plan_product
        publisher = var.plan_publisher
    }

}

