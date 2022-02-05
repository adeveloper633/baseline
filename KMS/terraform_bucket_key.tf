resource "aws_kms_key" "terraform_key" {
  description             = "Encrypts Terraform state in S3 bucket."
  deletion_window_in_days = 14
  enable_key_rotation     = true
}

resource "aws_kms_alias" "terraform_key_alias" {
  name          = "alias/terraform_key"
  target_key_id = aws_kms_key.terraform_key.key_id
}
