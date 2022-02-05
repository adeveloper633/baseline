resource "aws_dynamodb_table" "terraform_state" {
  name           = "terraform_locks"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
