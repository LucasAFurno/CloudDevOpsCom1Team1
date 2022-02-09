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
    region = "sa-east-1-c"
}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "vpc-devops"
    }
}
resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = "0.0.0.0/0"

    tags = {
        Name = "subnet-devops"
    }
}

resource "aws_ebs_volume" "volume" {
  availability_zone = "sa-east-1c"
  size              = 30

  tags = {
    Name = "Volume for all"
  }
}
resource "aws_instance" "ec2" {
    ami = var.my_ami 
    instance_type = var.my_intance_type
    subnet_id = aws_subnet.subnet.id
    tags = var.instance_tags
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume.id
  instance_id = aws_instance.ec2.id
}
