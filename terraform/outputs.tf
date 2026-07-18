output "cluster_name" { value = module.eks.cluster_name }
output "cloudfront_domain" { value = module.cdn.cloudfront_domain_name }
output "ecr_repository_url" { value = module.storage.ecr_repository_url }
output "redis_endpoint" { value = module.database.redis_endpoint }
