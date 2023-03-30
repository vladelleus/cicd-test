#!/bin/bash

IMAGE_NAME=$1
CONTAINER_NAME=myapp

# Pull the latest image from Docker Hub
docker pull $IMAGE_NAME

# Stop and remove the old container
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# Run the new container
docker run -d --name $CONTAINER_NAME -p 8000:8000 $IMAGE_NAME

