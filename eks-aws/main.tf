provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source   = "./module/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnets" {
  source             = "./module/subnets"
  vpc_id             = module.vpc.vpc_id
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  internet_gateway_id = module.vpc.internet_gateway_id
}

module "eks" {
  source             = "./module/eks"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.subnets.private_subnet_ids
  public_subnet_ids  = module.subnets.public_subnet_ids
  security_group_id  = module.vpc.security_group_id
  eks_cluster_name   = var.eks_cluster_name
}

module "s3" {
  source     = "./module/s3"
  s3_buckets = var.s3_buckets
}

module "ecr" {
  source               = "./module/ecr"
  ecr_repository_name  = var.ecr_repository_name
}

module "msk" {
  source           = "./module/msk"
  cluster_name     = var.msk_cluster_name
  subnets          = module.subnets.private_subnet_ids
  security_group_id = module.vpc.security_group_id
  number_of_broker_nodes = var.number_of_broker_nodes
}

module "glue" {
  source        = "./module/glue"
  database_name = var.glue_database_name
  table_name    = var.glue_table_name
  s3_location   = var.glue_s3_location
}
