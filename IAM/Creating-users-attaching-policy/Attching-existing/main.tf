provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  

  tags = {
    tag-key = "tag-value"
  }
}

data "aws_iam_policy" "s3_full" {
  name = "AmazonS3FullAccess"
}
resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.lb.name
  policy_arn = data.aws_iam_policy.s3_full.arn
}
