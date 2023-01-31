resource "aws_instance" "Blue-green-deployment-blue" {
  count                  = var.enable_blue_env ? var.blue_instance_count : 0
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  subnet_id              = element(local.subnets, count.index)
  vpc_security_group_ids = [aws_security_group.Blue-green-deployment.id]

  user_data = templatefile("./apache-script.sh", {
    file_content = "blue version 1.2 - ${count.index}"
  })

  tags = {
    Name                  = "Blue/Green Deployment ${count.index + 1} (v${var.infrastructure_version})"
    InfrastructureVersion = var.infrastructure_version
  }
}
