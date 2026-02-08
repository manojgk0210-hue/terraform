
variable "user_map" {
  type = map(object({
    role = string
    team = string
  }))

  default = {
    alice = { role = "dev", team = "backend" }
    bob   = { role = "qa",  team = "testing" }
    carol = { role = "ops", team = "infra" }
  }
}

resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}

resource "aws_iam_user" "map_users" {
  for_each = var.user_map

  name = each.key  # alice, bob, carol

  tags = {
    Role = each.value.role # dev, qa, ops
    Team = each.value.team # backend, testing, infra
  }
}

