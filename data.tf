data "aws_region" "main" {}

data "aws_route53_zone" "main" {
  name = "${var.route53_zone_name}."
}

data "aws_acm_certificate" "main" {
  domain   = "${var.route53_zone_name}"
  statuses = ["ISSUED"]
}
