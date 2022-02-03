terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "= 3.74.0"
    }
  }
}

provider "aws" {
  region = REGION
  shared_credentials_file = "~/.aws/terraform"
  profile = "default"
  allowed_account_ids = [ACCOUNT_ID]
  forbidden_account_ids = [ACCOUNT_ID]

  default_tags {
    tags {
      Company = "Your Company"
      Environment = "default"
      Repository = "adeveloper633/baseline"
    }
  }

  ignore_tags {
    keys = ["KeyToIgnore"]
  }

  insecure = false

  assume_role {
    role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
    session_name = "SESSION_NAME"
    external_id  = "EXTERNAL_ID"
  }
}

