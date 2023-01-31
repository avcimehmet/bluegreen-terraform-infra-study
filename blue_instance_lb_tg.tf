resource "aws_lb_target_group" "Blue-green-deployment-blue" {
  name     = "Blue-tg-blue-v${var.infrastructure_version}"
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

resource "aws_lb_target_group_attachment" "Blue-green-deployment-blue" {
  count            = length(aws_instance.Blue-green-deployment-blue)
  target_group_arn = aws_lb_target_group.Blue-green-deployment-blue.arn
  target_id        = aws_instance.Blue-green-deployment-blue[count.index].id
  port             = 80
}
