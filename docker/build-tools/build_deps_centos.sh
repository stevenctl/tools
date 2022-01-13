#!/bin/bash

set -e

yum install -y centos-release-scl epel-release
yum update -y
yum install -y devtoolset-9-gcc devtoolset-9-gcc-c++ devtoolset-9-libatomic-devel wget unzip which make cmake3 patch subversion ncurses-devel zlib-devel \
  python-virtualenv chrpath file perl-Data-Dumper tcl python2-psutil sudo rsync

# For LLVM to pick right libstdc++
mkdir -p /usr/lib/gcc/x86_64-redhat-linux
ln -s /opt/rh/devtoolset-9/root/usr/lib/gcc/x86_64-redhat-linux/9 /usr/lib/gcc/x86_64-redhat-linux

ln -s /usr/bin/cmake3 /usr/bin/cmake

useradd build