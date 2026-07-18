output "cluster_name" { value = aws_eks_cluster.this.name }
output "node_security_group_id" { value = aws_security_group.node.id }
output "cluster_endpoint" { value = aws_eks_cluster.this.endpoint }
output "alb_dns_name" { value = aws_lb.backend.dns_name }
