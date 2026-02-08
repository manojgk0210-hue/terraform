provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
    source = "./modules/vpc"
    # vcidr_block = "10.0.0.0/16"
}

module "ec2" {
    source = "./modules/ec2"
    # vami  = "ami-0f5ee92e2d63afc18"
    # vinstance_type= "t2.nano"
}
module "s3" {
    source = "./modules/s3"
    bucket_name = var.bucket_name

}