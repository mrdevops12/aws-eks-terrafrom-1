resource "aws_msk_cluster" "kafka_cluster" {
  cluster_name           = var.cluster_name
  kafka_version          = "2.6.0"
  number_of_broker_nodes = var.number_of_broker_nodes
  broker_node_group_info {
    instance_type = "kafka.m5.large"
    client_subnets = var.subnets
    security_groups = [var.security_group_id]
  }
  encryption_info {
    encryption_in_transit {
      client_broker = "TLS"
      in_cluster   = true
    }
  }
}

output "msk_cluster_arn" {
  value = aws_msk_cluster.kafka_cluster.arn
}

output "msk_cluster_bootstrap_brokers" {
  value = aws_msk_cluster.kafka_cluster.bootstrap_brokers
}
