#!/bin/sh

docker image inspect splice-node-builder > /dev/null 2>&1
if [ $? != 0 ]; then
    echo Docker image has not been built yet! Make sure to run create_builder.sh first
    exit 1
fi

mkdir -p build

BASEDIR="$(cd $(dirname $0) && pwd)"
docker run -v $BASEDIR/build:/build -it splice-node-builder $1
