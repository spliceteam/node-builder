#!/bin/sh

# Update the system and install devel tools
yum clean all
rm -rf /var/cache/yum/*
yum install -y epel-release yum-utils
yum install -y http://repo.ius.io/ius-release-el7.rpm
yum install -y http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum update -y
yum group install -y "Development Tools"
yum install -y centos-release-scl wget
yum install -y devtoolset-10 cmake
yum install -y python36u python36u-libs python36u-devel python36u-pip
