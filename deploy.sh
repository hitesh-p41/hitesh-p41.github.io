#!/bin/bash
set -e

S3_BUCKET=hitesh-p41.github.io

echo -e '\t Start deploying to S3.'
unset GIT_DIR
unset GIT_WORK_TREE

s3cmd sync --delete-removed --acl-public --exclude '.git/*' build/ s3://$S3_BUCKET/
echo -e '\t Deployment done to S3.'