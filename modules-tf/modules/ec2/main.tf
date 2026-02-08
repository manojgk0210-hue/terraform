resource "aws_instance" "ec2" {
    ami  = var.vami # Amazon Linux (ap-south-1)
    instance_type= var.vinstance_type
}