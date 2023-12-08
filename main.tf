terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

# Create a Ec2 instance
resource "aws_instance" "test-server-2" {
  ami = "ami-076433a70aba7f25d" # RHEL 
  instance_type = "t2.micro"

  tags = {
    Name = "test-server-2"
  }
}
