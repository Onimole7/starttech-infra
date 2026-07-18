variable "aws_region" { default = "us-east-1" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "cluster_version" { default = "1.34" }
variable "node_instance_type" { default = "t3.micro" }
variable "node_desired_size" { default = 2 }
