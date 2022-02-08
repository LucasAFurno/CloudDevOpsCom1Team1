terraform {
    required_providers {
      aws = { 
          version = "~> 2.0" 
      }
   }
    required_version = ">= 0.12"
}

provider "aws" {
    profile = "default" 
    region = "us-east-1"
}

resource "aws_vpc" "vpc-name" {
    cidr_block = "10.0.0.0/16"

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
    ami = "ami-0aad84f764a2bd39a" 
    instance_type = var.my_intance_type
    subnet_id = aws_subnet.subnet-name.id
    tags = var.instance_tags
}