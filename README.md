# React App Deployment with Terraform, S3 & CloudFront

This project demonstrates how to deploy a **React single-page application** (SPA) to **AWS S3** and serve it securely through **CloudFront**, with all infrastructure defined as code using **Terraform** and automated deployment via **GitHub Actions**.

## 🚀 What Was Implemented

1. **Infrastructure as Code (Terraform)**

   Provisions:

   - Private S3 bucket configured for static website hosting
   - CloudFront distribution
   - Origin Access Control (OAC) → secure bucket access (no public bucket policy)
   - Proper SPA routing support (`index.html` fallback for all paths)

   Typical workflow:

   ```bash
   terraform init
   terraform plan -out=tfplan
   terraform apply tfplan
   ```
   # Configure credentials (only needed once)
aws configure

# Upload build artifacts
```
aws s3 sync build/ s3://admiral-truck.web --delete
```

# Invalidate CloudFront cache (replace with your distribution ID)
```
aws cloudfront create-invalidation \
  --distribution-id E1BFBEW0WRKR13 \
  --paths "/*"
  ```

 <strong> These steps are fully automated in the GitHub Actions workflow:</strong>
* GitHub Actions CI/CD Workflow
Triggers on changes to the build/ folder (or manual dispatch)
* Uploads files directly to S3
* Invalidates CloudFront cache
* Important architectural decision:
* ❌ No npm run build inside CI
* ❌ No lint / test steps in deployment pipeline
* ✅ Deploys pre-built artifacts only
* Reason: CI=true makes ESLint treat warnings as errors → avoids unnecessary CI failures.

### 📦 Deployment Flow

<strong>
   <center> Local →  npm run build </br>
            ↓</br>
      commit build/ folder</br>
            ↓</br>
     GitHub Actions (on push / manual) </br>
            ↓</br>
       AWS S3 (private bucket)</br>
            ↓</br>
     CloudFront (HTTPS + caching + global CDN)</br> </center>
     </strong>