#=============#
# ROLE
#=============#

resource "aws_iam_role" "assume_role" {
  name = var.role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Principal" : { "AWS" : "arn:aws:iam::${var.account_id}:root" }
        "Action" : [
          "sts:AssumeRole"
        ],
      },
    ]
  })
}

#=============#
# POLICY
#=============#
resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = "Allows assuming role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "iam:ListRoles",
          "sts:AssumeRole"
        ],
        "Resource" : "*"
      },
    ]
  })
}

#=============#
# GROUP
#=============#
resource "aws_iam_group" "group" {
  name = var.group_name
}

#=============#
# USER
#=============#
resource "aws_iam_user" "iam" {
  name = var.iam_user_name

}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.iam.name
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group_policy_attachment" "policy_attachment" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy.arn
}
