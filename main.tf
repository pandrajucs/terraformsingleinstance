#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "= 1.1.9" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  #Backend configuration
  backend "s3" {
    bucket         = "terraformcs"
    key            = "functions.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state"
    encrypt        = true
  }
}

#VPC Creation
resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "CS"
    environment = "${var.environment}"
  }
}

#IGW Creation
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}

