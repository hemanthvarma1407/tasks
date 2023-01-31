provider "aws" {
region = "ap-northeast-1"
access_key ="AKIAVNHPR4OBS3HNBQNB"
secret_key ="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"
}
resource "aws_instance" "main" {
ami = "ami-06ee4e2261a4dc5c3"
instance_type = "t2.micro"
security_groups = ["${aws_security_group.security.name}"]
tags = {
Name = "terraform"
}
}
resource "aws_security_group" "security" {
name = "SSH"
vpc_id = "vpc-0840f1d9df209a170"

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = -1
cidr_blocks = ["0.0.0.0/0"]
}
}
