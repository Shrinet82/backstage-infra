terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "Shrinet82"
    workspaces {
      name = "backstage-aws-vpc"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "cidr_block" {
  type        = string
  description = "VPC CIDR block, e.g. 10.10.0.0/16"
}

resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = var.vpc_name
    ManagedBy   = "Backstage"
  }
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the VPC"
}

output "vpc_arn" {
  value       = aws_vpc.main.arn
  description = "ARN of the VPC"
}

output "vpc_cidr" {
  value       = aws_vpc.main.cidr_block
  description = "CIDR of the VPC"
}
