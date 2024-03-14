#Task 1
resource "aws_iam_policy_attachment" "s3_read_only_access" {
  name       = "S3ReadOnlyAccess"
  roles      = [aws_iam_role.ReadOnlyS3AccessRole.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

#Task 2
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


# Task 3
resource "aws_iam_user" "s3Readeruser" {
 name = "s3Readeruser"
}

resource "aws_iam_policy_attachment" "attachAssumeRole" {
  name       = "attachAssumeRole"
  users      = [aws_iam_user.s3Readeruser.name]
  roles      = [aws_iam_role.ReadOnlyS3AccessRole.name]
  #groups     = [aws_iam_group.group.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

output "Role_Arn" {
  value = aws_iam_policy_attachment.attachAssumeRole.name
 }

 output "User_name" {
  value = aws_iam_user.s3Readeruser.name
 }

 output "terraform_group" {
  value = "Bushido Code"
}
output "Group_Members" {
  value =<<-EOT
   Lynn Parrish
   Dimitri Burrell
   Christian Akanni
   Charlie Morse
   Yahshua Emmanual Ball
   Shawn Brown
   Ahch Wordz
EOT
}
