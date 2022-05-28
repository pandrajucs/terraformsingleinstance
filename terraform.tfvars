aws_region         = "us-east-1"
vpc_cidr           = "10.3.0.0/16"
vpc_name           = "Functions-VPC"
environment        = "dev"
azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_cidrblocks  = ["10.3.1.0/24", "10.3.2.0/24", "10.3.3.0/24", "10.3.4.0/24", "10.3.5.0/24"]
private_cidrblocks = ["10.3.10.0/24", "10.3.20.0/24", "10.3.30.0/24", "10.3.40.0/24", "10.3.50.0/24"]

