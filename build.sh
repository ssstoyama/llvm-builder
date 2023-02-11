#!/bin/sh

TARGET=$DOCKER_USER/$DOCKER_IMAGE:$DOCKER_TAG
echo "building image $TARGET" \
&& docker build --build-arg LLVM_VER=$LLVM_VER -t $TARGET . \
&& docker login -u $DOCKER_USER -p $DOCKER_PASSWORD \
&& docker push $TARGET
