# Create a VPC
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Main VPC"
  }
}

# Create subnets for the RDS instance
resource "aws_subnet" "default" {
  count = 2

  vpc_id            = aws_vpc.default.id
  cidr_block        = element(local.subnet_cidr_blocks, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "RDS subnet ${count.index}"
  }
}

# Get availability zones
data "aws_availability_zones" "available" {}
