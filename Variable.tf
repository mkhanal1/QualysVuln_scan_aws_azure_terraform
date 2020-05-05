data "aws_ami" "example" {
  most_recent = true
  owners      = ["aws-marketplace"]
  filter {
    name   = "product-code"
    values = ["1mp9h4zd2ze4biqif5schqeyu"]
  }
}

data "aws_ami" "target_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
    filter {
    name   = "architecture"
    values = ["x86_64"]
  }
    filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

}

variable "instance_type" {
  type        = string
  description = "The Instance type"
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "key_name"{
  type = string
}

variable "subnet_id" {
  type    = string
}

variable "scannername" {
  description = "A name for a scanner"
  type        = string
}

variable "username" {
  description = "username for Qualys cloudview"
  type        = string
}

variable "password" {
  description = "password for Qualys cloudview"
  type        = string
}

variable "baseurl" {
  description = "url for Qualys cloudview eg: https://qualysguard.qg2.apps.qualys.com"
  type        = string
}

variable "optionprofile" {
  type        = string
  description = "The Scanning option Profile"
}
