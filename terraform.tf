terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "= 3.74.0"
    }
  }
  
  backend "s3" {
    bucket         = "terraform-state-tes"
    key            = "terraform-tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform_locks_test"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
  shared_credentials_file = "~/.aws/credentials"
  profile = "default"
  allowed_account_ids = [var.aws_account_id]
  forbidden_account_ids = []

  default_tags {
    tags {
      Company = var.company_name
      Environment = var.default_environment
      Repository = var.git_repository
    }
  }

  ignore_tags {
    keys = var.ignore_tags
  }

  insecure = false

#  assume_role {
#    role_arn     = "arn:aws:iam::${aws_account_id}:role/${aws_role_name}"
#    session_name = var.sts_session_name
#  }
}

