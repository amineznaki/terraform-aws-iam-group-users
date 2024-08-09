resource "aws_iam_group" "devteam" {
    name = "dev-team"
}

resource "aws_iam_user" "dev1" {
    name = "dev1"
}

resource "aws_iam_user" "dev2" {
    name = "dev2"
}

resource "aws_iam_user" "dev3" {
    name = "dev3"
}

resource "aws_iam_group_membership" "dev_team_members" {
    name = "dev-team-membership"
  group = aws_iam_group.devteam.name
  users = [
    aws_iam_user.dev1.name,
    aws_iam_user.dev2.name,
    aws_iam_user.dev3.name,
  ]
}

resource "aws_iam_group_policy_attachment" "poweruser_access" {
    group = aws_iam_group.devteam.name
    policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}