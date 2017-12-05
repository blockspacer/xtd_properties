#!/bin/bash

set -ev

# create build folder
mkdir -p build

#install CMake 3.8 or later
cd build
if [ "${TRAVIS_OS_NAME}" == "linux" ]; then
  mkdir -p external/cmake
  pushd external/cmake
  wget https://cmake.org/files/v3.8/cmake-3.8.0-Linux-x86_64.sh
  chmod +x cmake-*-Linux-x86_64.sh
  ./cmake-*-Linux-x86_64.sh --exclude-subdir --skip-license
  export PATH="${PWD}/bin:$PATH"
  popd
else
  if ! brew ls --version cmake &>/dev/null; then brew update; brew install cmake; fi
fi
cd ..