# Create a new bucket
aws s3api create-bucket --bucket acl-example-coque --region us-east-1

# turn off block public access 
aws s3api put-public-access-block \
--bucket acl-example-coque \
--public-access-block-configuration  "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# checking the change
aws s3api get-public-access-block --bucket acl-example-coque

# change bucket ownership
aws s3api put-bucket-ownership-controls \
    --bucket acl-example-coque \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"

# change acl to allow other user (xml doesnt work, should be a json)
aws s3api put-bucket-acl \
    --bucket acl-example-coque \
    --access-control-policy file:///pyprojects/AWS-practica/s3/acl/access.xml