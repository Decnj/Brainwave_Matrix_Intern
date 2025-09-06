# All input variables used in provisioning this infrastructure


# Sets the AWS Region
variable "region" {
  default = "us-east-1"
}


# Selects Amazon Linux 2023 Kernel-6.12 AMI Free tier
variable "ami_id" {
  default = "ami-00ca32bbc84273381"
}


# Public key path
variable "pub_key_path" {
  default = "/Users/Dee/.ssh/id_rsa.pub"
}

