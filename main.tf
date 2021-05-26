terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "personal"
  region  = "us-east-1"
}

resource "aws_instance" "db_instance" {
  ami           = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"
  user_data = file("bootstrap.sh")
  vpc_security_group_ids = [aws_security_group.db_instance_sg.id]

  tags = {
    Name = "MySQLTerraformInstance"
  }
}

resource "aws_security_group" "db_instance_sg" {
  name = "MySQLTerraformInstance-sg"

  ingress {
    description = "Allow 3306 from everywhere"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "db-url" {
  value = "${aws_instance.db_instance.public_dns}:3306"
}