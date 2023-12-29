#!/bin/bash
set -eo pipefail
FUNCTION=$(aws cloudformation describe-stack-resource --stack-name blank-python --logical-resource-id function --query 'StackResourceDetail.PhysicalResourceId' --output text --profile ic-admin)

echo Function Name: $FUNCTION

while true; do
  aws lambda invoke --function-name $FUNCTION --payload fileb://event.json out.json --profile ic-admin
  cat out.json
  echo ""
  sleep 2
done
