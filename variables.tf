variable "container_definitions" {}

variable "container_http_port" {
  default = 80
}

variable "container_https_port" {
  default = 443
}

variable "cpu" {
  default = 256
}

variable "desired_count" {
  default = 2
}

variable "ecs_cluster_id" {
  default = ""
}

variable "memory" {
  default = 512
}

variable "private_subnet_ids" {
  type = "list"
}

variable "public_subnet_ids" {
  type = "list"
}

variable "route53_zone_name" {}

variable "security_group_ids" {
  type = "list"
}

variable "vpc_id" {}

variable "name" {}
