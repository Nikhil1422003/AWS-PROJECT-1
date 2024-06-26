output "ec2_security_group_id" {
  value = aws_security_group.ec2_security_group.id
}

output "rds_security_group_id" {
  value = aws_security_group.rds_security_group.id
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.asg.name
}
