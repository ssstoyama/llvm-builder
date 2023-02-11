#!/bin/sh

ALIAS=$DOCKER_USER/$DOCKER_IMAGE

docker build -t $ALIAS:$DOCKER_TAG .
docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
docker push $ALIAS:$DOCKER_TAG
