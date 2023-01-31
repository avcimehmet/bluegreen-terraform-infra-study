resource "aws_security_group" "Blue-green-deployment" {
  name        = "Blue-green-deployment (v${var.infrastructure_version})"
  description = "Blue-green-deployment"
  vpc_id      = aws_vpc.Blue-green-deployment.id

  tags = {
    Name = "Blue-green-deployment (v${var.infrastructure_version})"
  }
}