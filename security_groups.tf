# Create a security group for the EC2 instances
resource "aws_security_group" "ec2_security_group" {
  vpc_id      = aws_vpc.default.id
  name        = "ec2_security_group"
  description = "Allow all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a security group for the RDS instance
resource "aws_security_group" "rds_security_group" {
  vpc_id      = aws_vpc.default.id
  name        = "rds_security_group"
  description = "Allow traffic from EC2 instances"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
