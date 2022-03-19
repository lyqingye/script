#!/usr/bin/env bash

set -e -x
set -eo pipefail

VERSION=1.18
FILE_NAME=go${VERSION}.linux-amd64.tar.gz

if command -v go &> /dev/null
then
    echo "You already install golang"
    exit
fi

curl -sSOL https://go.dev/dl/${FILE_NAME}
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf ${FILE_NAME} 
rm -rf ${FILE_NAME}
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc
echo "export GOPATH=\$HOME/go" >> ~/.zshrc
echo "export GOBIN=\$GOPATH/bin" >> ~/.zshrc
