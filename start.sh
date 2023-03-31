#!/bin/bash

REGION=us-east-2
INSTANCE_TYPE=t2.micro
AMI_IMAGE=resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn-ami-hvm-x86_64-ebs
EBS_GB_SIZE=30
KEY_PAIR_NAME=key20230329
SECURITY_GROUP_ID=sg-02900ce07567a69e4
MAX_PRICE=0.01
USER_DATA=install.sh

aws ec2 run-instances \
    --count 1 \
    --instance-type ${INSTANCE_TYPE} \
    --image-id ${AMI_IMAGE} \
    --key-name ${KEY_PAIR_NAME} \
    --security-group-ids ${SECURITY_GROUP_ID} \
    --region ${REGION} \
    --instance-market-options '{
        "MarketType": "spot",
        "SpotOptions": {
            "MaxPrice": "'${MAX_PRICE}'",
            "SpotInstanceType": "persistent",
            "InstanceInterruptionBehavior": "stop"
        }
    }' \
    --block-device-mappings '{
        "DeviceName": "/dev/xvda",
        "Ebs": {
            "VolumeSize": '${EBS_GB_SIZE}',
            "VolumeType": "gp3"
        }
    }' \
    --user-data file://${USER_DATA}