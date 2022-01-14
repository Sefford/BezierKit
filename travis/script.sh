#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
	if [[ $TRAVIS_JOB_NAME = 'WebAssembly' ]]; then
    	if [ $RUN_TESTS == "YES" ]; then
			carton test
		fi
  	else
	  echo "project = $PROJECT, DESTINATION = $DESTINATION"
		set -o pipefail
		xcodebuild -version
		xcodebuild -showsdks
		# Build Framework in Debug and Run Tests if specified
		if [ $RUN_TESTS == "YES" ]; then
			xcodebuild -project "$PROJECT" -scheme "$SCHEME" -sdk "$SDK" -destination "$DESTINATION" -configuration Debug ONLY_ACTIVE_ARCH=NO test | xcpretty -c;
		else
			xcodebuild -project "$PROJECT" -scheme "$SCHEME" -sdk "$SDK" -destination "$DESTINATION" -configuration Debug ONLY_ACTIVE_ARCH=NO build | xcpretty -c;
		fi
		# Run `pod spec lint` if specified
		if [ $POD_LINT == "YES" ]; then
			pod spec lint;
		fi
	fi
	
elif [[ $TRAVIS_OS_NAME = 'linux' ]]; then
 	export PATH="${PWD}/${SWIFT_VERSION}-ubuntu18.04/usr/bin:${PATH}"
	swift test --enable-test-discovery
fi
