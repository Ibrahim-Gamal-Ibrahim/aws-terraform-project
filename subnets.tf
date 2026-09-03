resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_a_cidr

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "public-a"
  }
}
resource "aws_subnet" "public_b" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_b_cidr

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "public-b"
  }
}
resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_a_cidr

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "private_a"
  }

}
resource "aws_subnet" "private_b" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_b_cidr

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "private_b"
  }
}
