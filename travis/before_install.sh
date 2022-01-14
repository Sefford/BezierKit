#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  if [[ $TRAVIS_JOB_NAME = 'WebAssembly' ]]; then
    brew install swiftwasm/tap/carton
  fi
elif [[ $TRAVIS_OS_NAME = 'linux' ]]; then
  wget https://swift.org/builds/swift-5.3-release/ubuntu1804/${SWIFT_VERSION}/${SWIFT_VERSION}-ubuntu18.04.tar.gz
  tar xzf ${SWIFT_VERSION}-ubuntu18.04.tar.gz
fi
