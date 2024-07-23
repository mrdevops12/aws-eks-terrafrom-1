variable "cluster_name" {
  description = "The name of the MSK cluster"
  type        = string
}

variable "subnets" {
  description = "List of subnets for the MSK cluster"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group"
  type        = string
}

variable "number_of_broker_nodes" {
  description = "The number of broker nodes"
  type        = number
  default     = 2  # Adjust this value to be a multiple of the number of AZs
}
