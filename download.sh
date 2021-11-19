#!/bin/bash

TARGET_PLATFORM=$1
FILE_DESTINATION=$2

if [[ "$TARGET_PLATFORM" == *"386"* ]]; then
  FILE_SUFFIX="i386-buster"
elif [[ "$TARGET_PLATFORM" == *"amd64"* ]]; then
  FILE_SUFFIX="ubuntu-18.04"
elif [[ "$TARGET_PLATFORM" == *"arm64"* ]]; then
  FILE_SUFFIX="arm64-buster"
elif [[ "$TARGET_PLATFORM" == *"arm"* ]]; then
  FILE_SUFFIX="armhf-buster"
else
  exit 1
fi

FILE_URL="https://nightly.link/thirtythreeforty/neolink/workflows/build/master/release-$FILE_SUFFIX.zip"
wget -O $FILE_DESTINATION $FILE_URL
