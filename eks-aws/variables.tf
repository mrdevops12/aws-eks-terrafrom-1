variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.0.0/19", "10.0.32.0/19"]
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.64.0/19"]
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "eks_cluster"
}

variable "s3_buckets" {
  description = "List of S3 buckets to create"
  type        = list(string)
  default     = ["my-first-bucket-12345", "my-second-bucket-12345"]
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "my-ecr-repo"
}
