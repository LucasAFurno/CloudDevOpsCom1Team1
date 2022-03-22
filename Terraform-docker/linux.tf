provider "aws" {
  region = "us-east-1"
  access_key = "AKIAQFRFFK5SJDEJE6VL"
  secret_key = "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"
}

resource "aws_instance" "Docker" {
 
  ami = "ami-07eaf2ea4b73a54f6"
  instance_type = "t2.micro"
  key_name = "MycourseEc2"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

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
    
}
