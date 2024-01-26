terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

locals {
  template_entrys = {
    for template_name in var.template_list : template_name.name => template_name
  }

  template_entry_list = flatten([
    for template_name, template_details in local.template_entrys : [
        merge(template_details, { name = template_name })
    ]
  ])
  template_details = {
    for template_detail in local.template_entry_list : template_detail.name => template_detail
  }
}

resource "aws_launch_template" "ec2_template" {
  for_each = local.template_details
  name = each.value.name
  image_id = each.value.image_id
  instance_type = each.value.instance_type
  key_name = each.value.key_name
  update_default_version = true

  dynamic "block_device_mappings" {
    for_each = [for k, v in each.value.block_device_mappings : v]
    content {
      device_name = block_device_mappings.value.device_name
      ebs {
        volume_size = block_device_mappings.value.volume_size
        volume_type = block_device_mappings.value.volume_type
        delete_on_termination = block_device_mappings.value.delete_on_termination
      }
    }
  }
  dynamic "network_interfaces" {
    for_each = each.value.network_interfaces
    content {
      subnet_id = each.value.network_interfaces.subnet_id
      security_groups = [each.value.network_interfaces.security_groups]
    }
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
    Name  = each.value.name
    BU    = "SYS"
    ENV   = "UAT"
    }
  }
  iam_instance_profile {
    arn  = each.value.iam_instance_profile.arn
  }
  private_dns_name_options {
    hostname_type = each.value.private_dns_name_options.hostname_type
    enable_resource_name_dns_a_record = each.value.private_dns_name_options.enable_resource_name_dns_a_record
  }

  //user_data = lookup(each.value, "user_data", null) != null ? filebase64(lookup(each.value, "user_data")) : null
  user_data = can(each.value.user_data) ? filebase64(each.value.user_data) : null
}