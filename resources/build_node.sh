#!/bin/sh

NODE_VERSION=v$1

# Set up node.js by using devtoolset-10 toolchain
if [ -f "/opt/rh/devtoolset-10/enable" ]; then
   source /opt/rh/devtoolset-10/enable
else
   echo Devtoolset not installed
   exit 1
fi

# Download Node.js source tarball
echo Building version $NODE_VERSION
wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION.tar.gz
tar xzf node-$NODE_VERSION.tar.gz
cd node-$NODE_VERSION.tar.gz

# Configure and build Node.js
mkdir -p /build/dist
rm -rf /build/dist/node-$NODE_VERSION-linux-x64
./configure --prefix /build/dist/node-$NODE_VERSION-linux-x64
make
make install

# Validate Node.js functionality
pushd /build/dist/node-$NODE_VERSION-linux-x64
    bin/node -v
popd
 
# Package Node.js distribution
pushd /build
    mkdir -p releases

    # Delete existing release
    if [ -f releases/node-$NODE_VERSION-linux-x64.tar.gz ]; then
        rm -f releases/node-$NODE_VERSION-linux-x64.tar.gz
    fi

    # Package the release
    pushd dist
        tar -czf ../releases/node-$NODE_VERSION-linux-x64.tar.gz node-$NODE_VERSION-linux-x64
    popd
popd
