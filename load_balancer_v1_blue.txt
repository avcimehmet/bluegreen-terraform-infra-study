resource "aws_lb" "Blue-green-deployment" {
  name               = "Blue-green-deployment-v${var.infrastructure_version}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Blue-green-deployment.id]
  subnets            = aws_subnet.Blue-green-deployment.*.id

  tags = {
    Name = "Blue-green-deployment-v${var.infrastructure_version}"
  }
}

resource "aws_lb_listener" "Blue-green-deployment" {
  load_balancer_arn = aws_lb.Blue-green-deployment.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Blue-green-deployment-blue.arn
  }
}
