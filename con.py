import ibm_boto3
import os
from ibm_botocore.client import Config, ClientError

# Constants for IBM COS values
COS_ENDPOINT = os.environ['ENDPOINT' ]# "https://s3.us.cloud-object-storage.appdomain.cloud"
COS_API_KEY_ID = os.environ['API_KEY'] # "uClgWYDiEXBcSAWRSdF29Sq1wr11aCmQy5oEOrEv5VbF"
COS_AUTH_ENDPOINT = os.environ['AUTH_ENDPOINT'] #"https://iam.cloud.ibm.com/identity/token"
COS_RESOURCE_CRN = os.environ['RESOURCE_CRN'] #"crn:v1:bluemix:public:cloud-object-storage:global:a/b6c597e9c7804d2b9ab48afbe94726ab:1b09bb96-192c-4d07-b041-b54212b0cc6e::"
# Create resource
cos = ibm_boto3.resource("s3",
    ibm_api_key_id=COS_API_KEY_ID,
    ibm_service_instance_id=COS_RESOURCE_CRN,
    ibm_auth_endpoint=COS_AUTH_ENDPOINT,
    config=Config(signature_version="oauth"),
    endpoint_url=COS_ENDPOINT
)
print ("Connection Established")

def get_buckets():
    print("Retrieving list of buckets")
    try:
        buckets = cos.buckets.all()
        for bucket in buckets:
            print("Bucket Name: {0}".format(bucket.name))
    except ClientError as be:
        print("CLIENT ERROR: {0}\n".format(be))
    except Exception as e:
        print("Unable to retrieve list buckets: {0}".format(e))

get_buckets();

def get_item(bucket_name, item_name):
    print("Retrieving item from bucket: {0}, key: {1}".format(bucket_name, item_name))
    try:
        file = cos.Object(bucket_name, item_name).get()
        print("File Contents: {0}".format(file["Body"].read()))
    except ClientError as be:
        print("CLIENT ERROR: {0}\n".format(be))
    except Exception as e:
        print("Unable to retrieve file contents: {0}".format(e))

get_item("anil123anil123","sample.sql");
