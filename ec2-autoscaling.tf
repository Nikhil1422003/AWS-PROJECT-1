# Create an auto-scaling group and launch configuration
resource "aws_launch_configuration" "lc" {
  name          = "app-launch"
  image_id      = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer_key.key_name
  security_groups = [aws_security_group.ec2_security_group.id]

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd php php-mysqlnd
              systemctl start httpd
              systemctl enable httpd
              echo "<?php phpinfo(); ?>" > /var/www/html/index.php
              EOF
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 2
  vpc_zone_identifier  = aws_subnet.default[*].id
  launch_configuration = aws_launch_configuration.lc.id
  force_delete         = true

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
}
