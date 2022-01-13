#!/bin/bash

set -e

LLVM_VERSION=12.0.1

curl -sSL https://raw.githubusercontent.com/llvm/llvm-project/llvmorg-${LLVM_VERSION}/llvm/utils/release/test-release.sh | sed 's,http://llvm.org,https://llvm.org,' > /home/build/test-release.sh
chmod +x /home/build/test-release.sh

mkdir -p ${BUILD_DIR}

sudo scl enable devtoolset-9 \
  "/home/build/test-release.sh -release ${LLVM_VERSION} -final -triple x86_64-linux-centos7 -configure-flags '-DCOMPILER_RT_BUILD_LIBFUZZER=off' -build-dir ${BUILD_DIR}"
