variable "db_name" {
  description = "Name for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
}

variable "vpc_security_group_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "db_subnet_group_name" {
  description = "DB Subnet Group Name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "major_engine_version" {
  description = "Major engine version (e.g., 8.0 for MySQL 8.0)"
  type        = string
  default     = "8.0"
}

variable "family" {
  description = "DB parameter group family (e.g., mysql8.0)"
  type        = string
  default     = "mysql8.0"
}
