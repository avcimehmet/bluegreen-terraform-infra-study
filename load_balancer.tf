resource "aws_lb" "Blue-green-deployment" {
  name               = "Blue-Green-Deployment-v${var.infrastructure_version}"
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
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.Blue-green-deployment-blue.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "blue", 100)
      }

      target_group {
        arn    = aws_lb_target_group.Blue-green-deployment-green.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "green", 0)
      }

      stickiness {
        enabled  = false
        duration = 1
      }
    }
  }
}