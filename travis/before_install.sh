#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  # install macOS prerequistes
  :
elif [[ $TRAVIS_OS_NAME = 'linux' ]]; then
  if [[ $TRAVIS_JOB_NAME = 'WebAssembly' ]]; then
    docker run -v `pwd`:`pwd` -w `pwd` ghcr.io/swiftwasm/carton:latest /bin/sh -c 'carton test'
  else
    wget https://swift.org/builds/swift-5.3-release/ubuntu1804/${SWIFT_VERSION}/${SWIFT_VERSION}-ubuntu18.04.tar.gz
    tar xzf ${SWIFT_VERSION}-ubuntu18.04.tar.gz
  fi
fi
