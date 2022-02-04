terraform {
    required_providers {
      aws = {
          source = company-resgistry/aws 
          version = "~> 2.0" 
      }
   }

    required_version = ">= 0.12" 
}

locals {
  local_name = "t2.micro"
}

provider "aws" {
    profile = "default" 
    region = "us-east-1"
}

resource "aws_vpc" "vpc-name" {
    cidr_block = "10.5.0.0/16"

    tags = {
        Name = "vpc-test"
    }
}
resource "aws_subnet" "subnet-name" {
    vpc_id = aws_vpc.vpc-name.id 
    cidr_block = "10.5.0.0/16"

    tags = {
        Name = "subnet-test"
    }
}

resource "aws_instance" "ec2-name" {
    ami = "ami-id" 
    instance_type = var.my_intance_type 
    subnet_id = aws_subnet.subnet-name.id 

    tags = var.instance_tags
}

output vpc {
  value       = aws_vpc.vpc-name.id
  sensitive   = true
  description = "description"
}

