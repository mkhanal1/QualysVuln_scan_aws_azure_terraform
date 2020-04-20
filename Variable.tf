/*variable "instance_type" {
  type = map(string)

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "m4.large"
    stg     = "t2.small"
  }
}
*/
variable "env_type" {
  type = map(string)

  default = {
    default = "dev"
    dev = "dev"
    prod = "prod"
    stg = "stg"
  }
}
 /*variable "subnet_id" {
  type = string
  default = "subnet-0e827b141d5c7d815"
}
*/




data "aws_ami" "example" {
  most_recent      = true
  owners           = ["aws-marketplace"]

  filter {
    name   = "product-code"
    values = ["1mp9h4zd2ze4biqif5schqeyu"]
  }

}
 variable "instance_type" {
   type = string
 }

 variable "vpc_id" {}

 variable "scannername" {
   description = "A name for a scanner"
   type = string
 }

 variable "username" {
   description = "username for Qualys cloudview"
   type = string
 }
 variable "password" {
   description = "password for Qualys cloudview"
   type = string
 }

 variable "baseurl" {
   description = "url for Qualys cloudview"
   type = string
 }
 data "aws_subnet_ids" "example" {
  vpc_id = "vpc-0403cbbfb500d3fae"
}

data "aws_subnet" "example" {
  for_each = data.aws_subnet_ids.example.ids
  id       = each.value
}

variable "subnet_id" {
  type = list
}
/*
variable "image_id" {
  type = string
}
*/
