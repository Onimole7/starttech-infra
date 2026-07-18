terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }

  backend "s3" {
    bucket         = "starttech-tfstate-onimole7"
    key            = "starttech-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "starttech-tf-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "eks" {
  source             = "./modules/eks"
  vpc_id             = module.networking.vpc_id
  vpc_cidr_block     = var.vpc_cidr
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids  = module.networking.public_subnet_ids
  cluster_version    = var.cluster_version
  node_instance_type = var.node_instance_type
  node_desired_size  = var.node_desired_size
}

module "storage" {
  source = "./modules/storage"
}

module "database" {
  source             = "./modules/database"
  vpc_id             = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  eks_node_sg_id     = module.eks.node_security_group_id
}

module "cdn" {
  source                    = "./modules/cdn"
  s3_bucket_id              = module.storage.bucket_id
  s3_bucket_arn             = module.storage.bucket_arn
  s3_bucket_regional_domain = module.storage.bucket_regional_domain_name
  alb_dns_name              = module.eks.alb_dns_name
}
