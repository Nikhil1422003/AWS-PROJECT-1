# Create a subnet group for the RDS instance
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = aws_subnet.default[*].id

  tags = {
    Name = "Main subnet group"
  }
}

# Create an RDS instance
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.34"  
  instance_class       = "db.t3.micro"
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]

  skip_final_snapshot = true
}
