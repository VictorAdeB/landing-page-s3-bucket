output "s3_bucket_name" {
  description = "Name of the S3 bucket hosting the site"
  value       = aws_s3_bucket.site.bucket
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.cdn.id
}

output "cloudfront_domain_name" {
  description = "CloudFront domain name (use this to access the site)"
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "cloudfront_url" {
  description = "CloudFront HTTPS URL"
  value       = "https://${aws_cloudfront_distribution.cdn.domain_name}"
}