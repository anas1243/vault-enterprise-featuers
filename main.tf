provider "aws" {
  region = var.region
  }

  module "network" {
    source = "git@github.com:anas1243/public-network-terraform-module.git"
    use_case = var.use_case
    region = var.region
    public_subnet1_zone = var.public_subnet1_zone
    public_subnet2_zone = var.public_subnet2_zone
    vpc_cidr =  var.vpc_cidr
    public_subnet1_cidr =  var.public_subnet1_cidr
    public_subnet2_cidr  =  var.public_subnet2_cidr
    env =  var.env
  }