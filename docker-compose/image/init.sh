#!/bin/bash

# enable apt update
apt-get install -y apt-transport-https apt-utils

# install wget
apt-get update
apt-get install -y wget

# add microsoft repo
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb 
dpkg -i packages-microsoft-prod.deb

# install dos2unix and dotnet
apt-get update 
apt-get install -y dos2unix dotnet-sdk-6.0
