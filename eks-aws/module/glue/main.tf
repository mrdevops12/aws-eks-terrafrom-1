resource "aws_glue_catalog_database" "glue_db" {
  name = var.database_name
}

resource "aws_glue_catalog_table" "glue_table" {
  database_name = aws_glue_catalog_database.glue_db.name
  name          = var.table_name
  table_type    = "EXTERNAL_TABLE"
  parameters = {
    EXTERNAL = "TRUE"
  }

  storage_descriptor {
    columns {
      name = "column1"
      type = "string"
    }

    location      = var.s3_location
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
    ser_de_info {
      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"
      parameters = {
        "serialization.format" = "1"
      }
    }
  }
}

output "glue_database_name" {
  value = aws_glue_catalog_database.glue_db.name
}

output "glue_table_name" {
  value = aws_glue_catalog_table.glue_table.name
}
