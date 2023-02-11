#!/bin/sh

docker build -t $DOCKER_IMAGE:$DOCKER_TAG .
docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
docker push -t $DOCKER_IMAGE:$DOCKER_TAG
