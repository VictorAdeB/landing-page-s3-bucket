source "$(dirname "$$   BASH_SOURCE")/.env"   #this a necessary command for windows user as using source /filename won't work
echo "$S3_BUCKET"  
echo "$CLOUDFRONT_DISTRIBUTION_ID"  

aws s3 sync build/ "s3://${S3_BUCKET}" --delete --dryrun
aws s3 sync build/ "s3://${S3_BUCKET}" --delete
aws cloudfront create-invalidation --distribution-id "${CLOUDFRONT_DISTRIBUTION_ID}" --paths "/*"