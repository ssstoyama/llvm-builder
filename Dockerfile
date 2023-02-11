FROM debian:bullseye

ARG LLVM_VER=15

RUN apt update && apt install -y \
  git \
  cmake \
  gcc \
  ninja-build

WORKDIR /tmp

RUN git clone --depth 1 --branch release/15.x https://github.com/llvm/llvm-project llvm-project

RUN cd llvm-project \
 && git checkout release/${LLVM_VER}.x \
 && mkdir build-release \
 && cd build-release \
 && cmake ../llvm \
      -DCMAKE_INSTALL_PREFIX=$HOME/llvm-release \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_ENABLE_PROJECTS="lld;clang" \
      -DLLVM_ENABLE_LIBXML2=OFF \
      -DLLVM_ENABLE_TERMINFO=OFF \
      -DLLVM_ENABLE_LIBEDIT=OFF \
      -DLLVM_ENABLE_ASSERTIONS=ON \
      -DLLVM_PARALLEL_LINK_JOBS=1 \
      -G Ninja \
 && ninja install

RUN rm -rf /tmp/llvm-project

WORKDIR $HOME
