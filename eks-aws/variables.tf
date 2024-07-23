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

variable "msk_cluster_name" {
  description = "The name of the MSK cluster"
  type        = string
  default     = "my-msk-cluster"
}

variable "number_of_broker_nodes" {
  description = "The number of broker nodes for the MSK cluster"
  type        = number
  default     = 2  # Adjust this value to be a multiple of the number of AZs
}

variable "glue_database_name" {
  description = "The name of the Glue database"
  type        = string
  default     = "my_glue_database"
}

variable "glue_table_name" {
  description = "The name of the Glue table"
  type        = string
  default     = "my_glue_table"
}

variable "glue_s3_location" {
  description = "The S3 location for the Glue table"
  type        = string
  default     = "s3://my-bucket/glue/"
}
