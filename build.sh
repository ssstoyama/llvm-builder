#!/bin/sh

docker build --build-arg LLVM_VER=$LLVM_VER -t $DOCKER_IMAGE:$DOCKER_TAG .
docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
docker push $DOCKER_IMAGE:$DOCKER_TAG
