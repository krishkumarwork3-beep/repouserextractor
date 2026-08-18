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

role_response=$(aws iam create-role \
    --role-name "$role_name" \
    --assume-role-policy-document '{
      "Version": "2012-10-17",
      "Statement": [{
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": [
            "lambda.amazonaws.com",
            "s3.amazonaws.com",
            "sns.amazonaws.com"
          ]
        }
      }]
    }')

role_arn=$(echo "$role_response" | jq -r '.Role.Arn')

echo "Role ARN: $role_arn"

aws iam attach-role-policy \
    --role-name "$role_name" \
    --policy-arn arn:aws:iam::aws:policy/AWSLambda_FullAccess

aws iam attach-role-policy \
    --role-name "$role_name" \
    --policy-arn arn:aws:iam::aws:policy/AmazonSNSFullAccess