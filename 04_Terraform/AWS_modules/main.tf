locals {
  region="us-west-2"
}

provider "aws" {
  region = local.region
}

# Izveido VPC konfigurāciju
module "vpc" {
  source = "./modules/vpc"

  # Ievada eksistējošā VPC ID un subnet ID
  vpc_id        = "vpc-0e2edd2eaeabb5a70"
  cidr_block =  "172.31.64.0/20" 
  availability_zone = "${local.region}a"
}

# Izveido EC2 instanci
resource "aws_instance" "example_instance" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  availability_zone = "${local.region}a"
  subnet_id = module.vpc.public_subnet_id

  tags = {
    Name = "ExampleInstance"
    Owner= "Deniss"
  }
}