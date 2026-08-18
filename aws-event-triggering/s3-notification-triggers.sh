#!/bin/bash

set -x

aws_account_id=$(aws sts get-caller-identity \
    --query 'Account' \
    --output text)

echo "AWS Account ID: $aws_account_id"

aws_region="ap-south-1"
bucket_name="krish1234554321"
lambda_func_name="s3-lambda-function"
role_name="s3-lambda-sns"
email_address="xyz@gmail.com"