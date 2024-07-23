variable "database_name" {
  description = "The name of the Glue database"
  type        = string
}

variable "table_name" {
  description = "The name of the Glue table"
  type        = string
}

variable "s3_location" {
  description = "The S3 location for the Glue table"
  type        = string
}
