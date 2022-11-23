resource "aws_vpc" "docker_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.docker_vpc.id
  cidr_block = var.cidr_public
  # map_public_ip_on_launch = true

  tags = {
    Name = "public"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.docker_vpc.id

  tags = {
    Name = "internet_gateway"
  }
}