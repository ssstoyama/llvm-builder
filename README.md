# Building LLVM from source

This project aims to build llvm from git source code with docker.
Uploads the image to the specified registry after the build completes.

```bash
export DOCKER_USER=<username of Docker Hub>
export DOCKER_PASSWORD=<password of Docker Hub>
export DOCKER_IMAGE=<image name>
export DOCKER_TAG=<tag name>
export LLVM_VER=<llvm version> # eg. 15, 16

# 1. building image
# 2. login to Docker Hub
# 3. push image named "$DOCKER_USER/DOCKER_IMAGE:$DOCKER_TAG" to Docker Hub
./build.sh
```