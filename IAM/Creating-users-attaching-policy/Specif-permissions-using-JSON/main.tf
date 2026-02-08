provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  

  tags = {
    tag-key = "tag-value"
  }
}
resource "aws_iam_policy" "policy" {
  name = "test-policy"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "AllowPutObject"
        Effect = "Allow"
        Action = "s3:PutObject"
        Resource = "arn:aws:s3:::amzn-s3-demo-bucket/*"

        Condition = {
          StringNotEquals = {
            "s3:x-amz-server-side-encryption" = "aws:kms"
          }
        }
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.lb.name
  policy_arn = aws_iam_policy.policy.arn
}
