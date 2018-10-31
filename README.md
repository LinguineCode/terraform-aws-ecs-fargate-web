# terraform-aws-ecs-fargate-web

A terraform module that creates resources to serve up a web application hosted in ECS with the Fargate compute engine

## Features

### ECS

  1. Creates the ECS service and supporting resources

### Load Balancer

  1. Creates a Load Balancer listening on HTTP and HTTPS ports (defaults to 80 and 443)
  1. Creates a security group to allow traffic from HTTP/HTTPS from `0.0.0.0/0`
  1. Creates a rewrite rule to redirect HTTP->HTTPS
  1. Creates an S3 Bucket for ALB Access Logs

### Route53
  1. Finds the Route53 zone based on domain name provided
  1. Creates a Route53 Alias Record for the LB within the zone

### Certificate for LB
  1. Finds the certificate for the LB via AWS Certificate Manager based on the domain name provided

## Usage

```
module "mywebservice" {
  source = "github.com/seanscottking/terraform-aws-ecs-fargate-web.git"

  container_definitions   = "${data.template_file.mywebservice.rendered}"
  ecs_cluster_id          = "${aws_ecs_cluster.main.id}"
  private_subnet_ids      = "${module.vpc.private_subnet_ids["private"]}"
  name                    = "${local.name_tag}"
  public_subnet_ids       = "${module.vpc.public_subnet_ids["public"]}"
  route53_zone_name       = "mywebservice.mycompany.com"
  security_group_ids      = ["${module.vpc.default_security_group_id}"]
  vpc_id                  = "${module.vpc.vpc_id}"
}
```

## Outputs

  1. `aws_route53_record` (string)
