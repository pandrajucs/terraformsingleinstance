variable "aws_region" {}
#variable "amis" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "azs" {}
variable "public_cidrblocks" {}
variable "private_cidrblocks" {}
variable "environment" {}
#Map variable creation
variable "imageids" {
  type = map(any)
  default = {
    us-east-1 = "ami-0c4f7023847b90238"
    us-east-2 = "ami-0eea504f45ef7a8f7"
  }
}
#variable "instance_type" {}

