FROM debian:bullseye

RUN apt update && apt install -y \
  git \
  cmake \
  gcc \
  ninja-build

WORKDIR /tmp

RUN git clone --depth 1 --branch release/15.x https://github.com/llvm/llvm-project llvm-project-15

RUN cd llvm-project-15 \
 && git checkout release/15.x \
 && mkdir build-release \
 && cd build-release \
 && cmake ../llvm \
      -DCMAKE_INSTALL_PREFIX=$HOME/llvm15-release \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_ENABLE_PROJECTS="lld;clang" \
      -DLLVM_ENABLE_LIBXML2=OFF \
      -DLLVM_ENABLE_TERMINFO=OFF \
      -DLLVM_ENABLE_LIBEDIT=OFF \
      -DLLVM_ENABLE_ASSERTIONS=ON \
      -DLLVM_PARALLEL_LINK_JOBS=1 \
      -G Ninja \
 && ninja install

RUN cd /tmp \
 && rm -rf /tmp/llvm-project-15
