resource "aws_internet_gateway" "Blue-green-deployment" {
  vpc_id = aws_vpc.Blue-green-deployment.id

  tags = {
    Name = "Blue-green-deployment  (v${var.infrastructure_version}"
  }
}