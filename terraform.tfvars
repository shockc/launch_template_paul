template_list = [
  {
    name          = "Template_Windows_2019"
    image_id      = "ami-082118e29087409a8"
    instance_type = "t2.medium"
    key_name      = "_windows_key"
    update_default_version = true
    block_device_mappings = {
      "/dev/sda1" = {
        device_name = "/dev/sda1"
        volume_size = 60
        volume_type = "gp2"
        delete_on_termination = "true"
      }
      "xvdb" = {
        device_name = "xvdb"
        volume_size = 35
        volume_type = "gp2"
        delete_on_termination = "true"
      }
      "xvdc" = {
        device_name = "xvdc"
        volume_size = 5
        volume_type = "gp2"
        delete_on_termination = "true"
      }
    }
    network_interfaces = {
      associate_public_ip_address = false
      security_groups = "sg-088483dba03a82ea5"
      subnet_id = "subnet-051fa74d7bfc81eb5"
    }
    tag_specifications = {
      resource_type = "instance"
      tags = {
        Name = "Template_Windows_2019"
        BU = "SYS"
        ENV = "UAT"
      }
    }
    iam_instance_profile = {
      arn  = "arn:aws:iam::282191626626:instance-profile/_SSM_EC2_role"
    }
    private_dns_name_options = {
    enable_resource_name_dns_a_record   = true
    hostname_type   = "ip-name"
    }
    //user_data = "./windows_provision.ps1"
  },
  {
    name          = "Template_Windows_2019_INF_Subnet01"
    image_id      = "ami-082118e29087409a8"
    instance_type = "t2.medium"
    key_name      = "_windows_key"
    update_default_version = true
    block_device_mappings = {
      "/dev/sda1" = {
        device_name = "/dev/sda1"
        volume_size = 60
        volume_type = "gp2"
        delete_on_termination = "true"
      }
      "xvdb" = {
        device_name = "xvdb"
        volume_size = 35
        volume_type = "gp2"
        delete_on_termination = "true"
      }
      "xvdc" = {
        device_name = "xvdc"
        volume_size = 5
        volume_type = "gp2"
        delete_on_termination = "true"
      }
    }
    network_interfaces = {
      associate_public_ip_address = false
      security_groups = "sg-097f3db21f7e2a7a6"
      subnet_id = "subnet-051fa74d7bfc81eb5"
    }
    tag_specifications = {
      resource_type = "instance"
      tags = {
        Name = "Template_Windows_2019_INF_Subnet01"
        BU = "SYS"
        ENV = "UAT"
      }
    }
    iam_instance_profile = {
      arn  = "arn:aws:iam::282191626626:instance-profile/_SSM_EC2_role"
    }
    private_dns_name_options = {
      enable_resource_name_dns_a_record   = true
      hostname_type   = "ip-name"
    }
    user_data = "./windows_provision.ps1"
  }
]