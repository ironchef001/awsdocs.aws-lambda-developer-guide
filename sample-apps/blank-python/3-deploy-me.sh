#!/bin/bash
set -eo pipefail
ARTIFACT_BUCKET=$(cat bucket-name.txt)

aws cloudformation package --template-file template.yml --s3-bucket $ARTIFACT_BUCKET --output-template-file out.yml --profile ic-admin
aws cloudformation deploy --template-file out.yml --stack-name blank-python --capabilities CAPABILITY_NAMED_IAM --profile ic-admin
