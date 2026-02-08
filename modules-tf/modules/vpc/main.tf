resource "aws_vpc" "my-vpc" {
  cidr_block = var.vcidr_block
  tags = {
    Name = "module-vpc"
  }
}