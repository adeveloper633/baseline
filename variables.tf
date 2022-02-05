variable "aws_account_id" {
  type = string
  default = "1882-8368-2647"
}

variable "aws_region" {
  type = string
  default = "us-east-2"
}

variable "aws_role_name" {
  type = string
  default = "terraform-provisioning"
}

variable "company_name" {
  type = string
  default = "Startup Baseline"
}

variable "default_environment" {
  type = string
  default = "default"
}

variable "git_repository" {
  type = string
  default = "adeveloper633/baseline"
}

variable "ignore_tags" {
  type = list
  default = []
}

variable "sts_session_name" {
  type = string
  default = "provisioning"
}

