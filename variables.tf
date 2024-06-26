variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "db_name" {
  description = "The name of the RDS database"
  default     = "intel"
}

variable "db_username" {
  description = "The username for the RDS database"
  default     = "admin"
}

variable "db_password" {
  description = "The password for the RDS database"
  default     = "intel123"
}

locals {
  subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
}
