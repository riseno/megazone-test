locals {
  default_tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "megazone-test"
  cidr = "10.0.0.0/16"

  azs              = ["ap-east-1a", "ap-east-1b", "ap-east-1c"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnets = [for k, v in ["ap-east-1a", "ap-east-1b", "ap-east-1c"] : cidrsubnet("10.0.0.0/16", 8, k + 8)]

  database_subnet_names = ["megazone-rds"]

  enable_nat_gateway = true

  tags = local.default_tags
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = "megazone-eks-cluster"
  cluster_version = "1.27"

  cluster_endpoint_private_access = false
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    green = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.large", "m5.large"]
      capacity_type  = "SPOT"
    }
  }

  create_aws_auth_configmap = false
  manage_aws_auth_configmap = true

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::337550234746:root"
      username = "ryanchan"
      groups   = ["system:masters"]
    }
  ]

  tags = local.default_tags
}