#=============#
# PROVIDER
#=============#
provider "aws" {
  region = "us-east-1"
}

#================================#
# PERSISTENT STATE BACKEND
#================================#
terraform {
  backend "s3" {
    bucket = "ecsworkshopbucket00"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


#=============#
# MODULES
#=============#
module "iam" {
  source        = "./module"
  role_name     = var.role_name
  policy_name   = var.policy_name
  group_name    = var.group_name
  iam_user_name = var.iam_user_name
  account_id    = var.account_id
}
