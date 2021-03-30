resource "aws_vpc" "webpa" {
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = {
    Name = var.name
  }
}

resource "aws_internet_gateway" "webpa" {
  vpc_id = aws_vpc.webpa.id
  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.webpa.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.webpa.id
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.webpa.id
  cidr_block              = var.public_subnet
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "${var.name}-public"
  }
}

resource "aws_subnet" "private" {
  cidr_block = var.private_subnet
  vpc_id     = aws_vpc.webpa.id
  tags = {
    Name = "${var.name}-private"
  }
}


