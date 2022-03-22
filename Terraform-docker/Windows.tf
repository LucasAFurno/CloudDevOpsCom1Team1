provider "aws" {
  region = "us-east-1"
  access_key = "AKIAQFRFFK5SJDEJE6VL"
  secret_key = "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"
}

resource "aws_instance" "prueba2" {
 
  ami = "ami-01b20f5ea962e3fe7"
  instance_type = "t2.micro"
  key_name = "MycourseEc2"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

}

resource "aws_security_group" "allow_rdp" {
    name = "allow_rdp"
    description = "allow rdp traffic"

ingress {

    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}
    
}
