# AWS-practica
SSA esamples codebase


# File .env needed
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=eu-west-3

# Execute scripts (desde git bash)
bash sync.sh

# CDK 
cdk bootstrap
cdk deploy
cdk destroy

# Pulumi
pulumi new -l (to list all the options)