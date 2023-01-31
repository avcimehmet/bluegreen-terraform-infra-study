resource "aws_lb_target_group" "Blue-green-deployment-green" {
  name     = "blue-tg-green-v${var.infrastructure_version}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Blue-green-deployment.id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}

resource "aws_lb_target_group_attachment" "Blue-green-deployment-green" {
  count            = length(aws_instance.Blue-green-deployment-green)
  target_group_arn = aws_lb_target_group.Blue-green-deployment-green.arn
  target_id        = aws_instance.Blue-green-deployment-green[count.index].id
  port             = 80
}
