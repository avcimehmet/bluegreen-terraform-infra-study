resource "aws_instance" "Blue-green-deployment-green" {
  count                  = var.enable_green_env ? var.green_instance_count : 0
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  subnet_id              = element(local.subnets, count.index)
  vpc_security_group_ids = [aws_security_group.Blue-green-deployment.id]

  user_data = templatefile("./userdata-apache.sh", {
    file_content = "green version 1.1 - ${count.index}"
  })

  tags = {
    Name                  = "Blue/Green Deployment ${count.index + 1} (v${var.infrastructure_version})"
    InfrastructureVersion = var.infrastructure_version
  }
}
