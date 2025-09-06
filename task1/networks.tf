# Setting up VPC, Public Subnet, Internet Gateway, Route Table  and Route Table Association


# VPC set up
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "brainwave-vpc"
  }
}


# Public subnet setup
resource "aws_subnet" "pub_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "brainwave-public-subnet"
  }
}


# Internet gateway setup
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "brainwave-igw"
  }
}


# Public subnet route table set up
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "brainwave-rt"
  }
}


# Route table association
resource "aws_route_table_association" "pub_subnet_association" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
