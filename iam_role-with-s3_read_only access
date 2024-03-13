#Create an IAM Role with S3 Read-Only Access:
resource "aws_iam_role" "ReadOnlyS3AccessRole" {
  name = "ReadOnlyS3AccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
   Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "s3_read_only_access" {
  name       = "S3ReadOnlyAccess"
  roles      = [aws_iam_role.ReadOnlyS3AccessRole.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
