resource "aws_iam_user" "terraform_user" {
  name = "terraform-user"
  path = "/system/terraform/"
}

resource "aws_iam_access_key" "terraform_user_access_key" {
  user = aws_iam_user.terraform_user.name
}

resource "aws_iam_user_policy" "terraform_user_policy" {
  name = "terraform-user-policy"
  user = aws_iam_user.terraform_user.name

  policy = data.aws_iam_policy_document.terraform_user_policy_document.json
}

data "aws_iam_policy_document" "terraform_user_policy_document" {
  statement {
    actions = {
      "s3:*",
    }
    resources = {
      "arn:aws:s3:::*",
    }
  }
}

