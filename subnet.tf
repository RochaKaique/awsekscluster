resource "aws_subnet" "lab-public-a" {
  vpc_id                  = aws_vpc.kaiquelab_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "lab-public-b" {
  vpc_id                  = aws_vpc.kaiquelab_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 2"
  }
}
