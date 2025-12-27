terraform {
  backend "remote" {
    organization = "Shrinet82"
    workspaces {
      name = "backstage-aws-rds"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "rds_instance" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.1.1"

  identifier = "backstage-rds-${var.db_name}"
  engine     = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  username = "admin"
  password = var.db_password
  publicly_accessible = false
  vpc_security_group_ids = [var.vpc_security_group_id]
  db_subnet_group_name = var.db_subnet_group_name
  backup_retention_period = 7
  skip_final_snapshot = false
  final_snapshot_identifier = "backstage-rds-final"
}

output "db_instance_id" {
  value = module.rds_instance.db_instance_id
}

output "db_instance_arn" {
  value = module.rds_instance.db_instance_arn
}

output "db_endpoint" {
  value = module.rds_instance.db_instance_endpoint
}
