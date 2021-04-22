provider "aws" {
  region = "us-west-1"
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "fairwinds-challenge-sg" {
  name        = "fairwinds-challenge-sg"
  description = "Used in the terraform"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "fairwinds-munib" {
  ami           = "ami-0121ef35996ede438"
  instance_type = "t2.xlarge"
  tags = {
    "Name" = "fairwinds-test-munib"
  }
  key_name = "munib-key-pair"
  user_data     = <<-EOF
	#! /bin/sh
	curl -fsSl https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo groupadd docker
	sudo usermod -aG docker ubuntu
  docker run -d -p 80:3000 munibali1/fwec2
  EOF
}
