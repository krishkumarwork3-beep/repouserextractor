import boto3
import json


def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': json.dumps('Lambda function executed successfully')
    }