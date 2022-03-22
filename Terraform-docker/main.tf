provider "aws" {
  region = "us-east-1"
  access_key = "AKIAQFRFFK5SJDEJE6VL"
  secret_key = "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"
}

resource "aws_instance" "Linux-Terraform-docker" {
 
  ami = "ami-07eaf2ea4b73a54f6"
  instance_type = "t2.micro"
  key_name = "MycourseEc2"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker
sudo yum install docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
EOF
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allow ssh traffic"

ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}
ingress {
   from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
