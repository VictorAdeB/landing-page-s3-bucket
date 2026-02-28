

# aws cloudfront create-invalidation \
#   --distribution-id (your.id) \
#   --paths "/*"

# source .env
aws cloudfront create-invalidation --distribution-id "${CLOUDFRONT_DISTRIBUTION_ID}" --paths "/*"