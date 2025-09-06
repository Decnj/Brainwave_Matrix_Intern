# Configuring core resources like EC2, Security groups

provider "aws" {
  region = var.region
}


# Accessing Key pair
resource "aws_key_pair" "brainwave_key" {
  key_name   = "brainwave_key"
  public_key = file(var.pub_key_path)
}


# Setting up security group to allow HTTP and SSH
resource "aws_security_group" "web_sg" {
  name        = "web-app-sg"
  description = "Allows HTTP and SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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


# EC2 instance set up
resource "aws_instance" "brainwave_web_app" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.brainwave_key.key_name
  subnet_id                   = aws_subnet.pub_subnet.id
  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]
  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "BrainwaveWebApp"
  }
}
