# Task1 Project - Web Server Deployment on AWS EC2 instance using Terraform.
 
This project automates the deployment of a basic Apache web server on an AWS EC2 instance using Terraform. It provisions the necessary infrastructure including networking components and security configurations to make the server publicly accessible.


## Project Overview
Using Terraform, we:

- Create a custom VPC with public subnet
- Attach an Internet Gateway for external access
- Configure routing to allow traffic from anywhere
- Set a Security Group to permit SSH on port 22 and HTTP traffic on port 80
- Launches an EC2 instance running Amazon Linux
- Use a user-dtata script to:
  - Install Apache (httpd)
  - Create a simple HTML page at "/var/www/html/index.html"
  - Start and enable the 'httpd' service


## Configuration files

- main.tf : Defines the core infrastructure (EC2 instance and Security Group) 
- networks.tf : Defines VPC, Public Subnet, Internet Gateway, Route Table & Route Table Association 
- variables.tf : Defines the input variables for customizing our setup
- outputs.tf : Displays useful information after deployment (e.g. Public ip)
- user-data.sh : The script executed on EC2 startup to configure the web server


## Requirements

- Terraform (https://www.terraform.io/downloads)
- AWS CLI coonfigured with the appropriate aws credentials
- An AWS user account with the necessary permissions to create the resources


## Usage

terraform init
terraform plan
terraform apply

# NOTE: You can visit the EC2 instance's public ip in your browser to see the webpage

