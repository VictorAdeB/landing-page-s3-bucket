output "cloudfront_domain" {
  value = aws_cloudfront_distribution.cdn.domain_name
}

output "route53_nameservers" {
  value = aws_route53_zone.zone.name_servers
}