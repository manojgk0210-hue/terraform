variable "user_list" {
  type    = list(string)
  default = ["user1", "user2", "user3"]
}

resource "aws_iam_user" "list_users" {
  count = length(var.user_list)

  name = var.user_list[count.index]
}
