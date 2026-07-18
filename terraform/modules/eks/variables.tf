variable "vpc_id" { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "public_subnet_ids" { type = list(string) }
variable "cluster_version" { type = string }
variable "node_instance_type" { type = string }
variable "node_desired_size" { type = number }
variable "vpc_cidr_block" { type = string }
