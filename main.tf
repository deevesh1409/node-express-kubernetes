provider "aws" {
  region = "us-east-1"
}
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "node-express-cluster"
  cluster_version = "1.27"
  subnets         = ["subnet-xyz", "subnet-abc"]
  vpc_id          = "vpc-xyz"
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }
}
