#!/bin/bash

TARGETPLATFORM=$1
FILE_DESTINATION=$2

if [[ "$TARGETPLATFORM" == *"386"* ]]; then
  FILE_SUFFIX="i386-buster"
elif [[ "$TARGETPLATFORM" == *"amd64"* ]]; then
  FILE_SUFFIX="ubuntu-18.04"
elif [[ "$TARGETPLATFORM" == *"arm64"* ]]; then
  FILE_SUFFIX="arm64-buster"
elif [[ "$TARGETPLATFORM" == *"arm"* ]]; then
  FILE_SUFFIX="armhf-buster"
else
  exit 0
fi

wget -O $FILE_DESTINATION "https://nightly.link/thirtythreeforty/neolink/workflows/build/master/release-$FILE_SUFFIX.zip"
