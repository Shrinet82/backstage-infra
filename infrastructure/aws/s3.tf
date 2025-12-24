terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Terraform Cloud backend
  cloud {
    organization = "Shrinet82"
    workspaces {
      name = "backstage-aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name (globally unique)"
}

variable "environment" {
  type        = string
  default     = "development"
}

resource "aws_s3_bucket" "backstage_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = var.environment
    ManagedBy   = "Backstage"
  }
}

output "bucket_arn" {
  value       = aws_s3_bucket.backstage_bucket.arn
  description = "ARN of the created S3 bucket"
}

output "bucket_name" {
  value       = aws_s3_bucket.backstage_bucket.id
  description = "Name of the created S3 bucket"
}

output "bucket_region" {
  value       = var.aws_region
  description = "Region of the S3 bucket"
}

output "bucket_environment" {
  value       = var.environment
  description = "Environment tag of the bucket"
}
