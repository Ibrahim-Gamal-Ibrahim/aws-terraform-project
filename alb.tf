resource "aws_lb" "main" {
  name               = "terra-alb"
  internal           = false #means it facing the internet
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]

  tags = {
    Name = "terra-alb"
  }
}

resource "aws_lb_target_group" "app" {
  name     = "terra-app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled  = true
    protocol = "HTTP"
    port     = "traffic-port"
    path     = "/"
  }

  tags = {
    Name = "terra-app-tg"
  }
}

resource "aws_lb_target_group_attachment" "app_a" {
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = aws_instance.app_a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app_b" {
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = aws_instance.app_b.id
  port             = 80
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn

  port     = 443
  protocol = "HTTPS"

  ssl_policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"

  certificate_arn = aws_acm_certificate.main.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

