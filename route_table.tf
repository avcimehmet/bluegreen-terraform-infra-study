resource "aws_route_table" "Blue-green-deployment" {
  vpc_id = aws_vpc.Blue-green-deployment.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Blue-green-deployment.id
  }

  tags = {
    Name = "Blue-green-deployment  (v${var.infrastructure_version}"
  }
}