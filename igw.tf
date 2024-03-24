resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaiquelab_vpc.id

  tags = {
    Name = "kaiquelab_igw"
  }
}
