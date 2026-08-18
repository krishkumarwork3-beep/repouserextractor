import boto3
import json


def lambda_handler(event, context):
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']

    print(f"File '{object_key}' was uploaded to bucket '{bucket_name}'")

    sns_client = boto3.client('sns')

    return {
        'statusCode': 200,
        'body': json.dumps('Lambda function executed successfully')
    }