import json

def lambda_handler(event, context):
    """
    This is a basic example Lambda function. Replace with your actual logic.
    """
    message = "Hello from your deployed Lambda function!"

    return {
        "statusCode": 200,
        "body": json.dumps(message)
    }
