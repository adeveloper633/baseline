resource "aws_iam_role" "terraform_provisioning" {
  name = "terraform-provisioning"
  path = "/system/terraform/"

  assume_role_policy = data.aws_iam_policy_document.terraform_provisioning_assume_role_policy.json 

  inline_policy {
    policy = data.aws_iam_policy_document.terraform_provisioning_policy.json
  }
}

data "aws_iam_policy_document" "terraform_provisioning_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
      "sts:SetSourceIdentity",
    ]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "terraform_provisioning_policy" {

}
