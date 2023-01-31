resource "aws_vpc" "Blue-green-deployment" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"

  tags = {
    Name = "Blue-green-deployment (v${var.infrastructure_version})"
  }
}