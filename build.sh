#!/bin/sh

docker image inspect splice-node-builder > /dev/null 2>&1
if [ $? != 0 ]; then
    echo Docker image has not been built yet! Make sure to run create_builder.sh first
    exit 1
fi

mkdir -p build

docker run -v build:/build -it splice-node-builder $1
