provider "aws" {
  region = "us-west-1"
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "example-vpc"
	  Owner= "DenissP"
  }
}

resource "aws_subnet" "example_subnet" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "example-subnet"
	Owner= "DenissP"
  }
}

resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
  tags = {
    Name = "example-igw"
	Owner= "DenissP"
  }
}

resource "aws_route_table" "example_route_table" {
  vpc_id = aws_vpc.example_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }
  tags = {
    Name = "example-route-table"
	Owner= "DenissP"
  }
}

resource "aws_route_table_association" "example_route_table_association" {
  subnet_id = aws_subnet.example_subnet.id
  route_table_id = aws_route_table.example_route_table.id
}
