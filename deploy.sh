#!/bin/bash

IMAGE_NAME=$1
CONTAINER_NAME=myapp

# Configuring AWS

export AWS_SECRET_ACCESS_KEY=$2
export AWS_ACCESS_KEY_ID=$3
export AWS_DEFAULT_REGION=$4

# Configuring Docker to use ECR
aws ecr get-login-password --region $4 | docker login --username AWS --password-stdin $5.dkr.ecr.$4.amazonaws.com

# Pull the latest image from Docker Hub
docker pull $IMAGE_NAME

# Stop and remove the old container
docker stop $(docker ps -lq)
docker rm $(docker ps -lq)

# Run the new container
docker run -d --name $CONTAINER_NAME -p 8000:8000 $IMAGE_NAME

