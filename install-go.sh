#!/bin/bash

yay -S --noconfirm --needed go
yay -S --noconfirm --needed gopls
yay -S --noconfirm --needed golangci-lint

gopath=`go env GOPATH`
if ! grep -q "$gopath/bin" ~/.bashrc; then
  echo "Adding \"$gopath/bin\" to PATH"
  echo "export PATH=\$PATH:$gopath/bin" >> ~/.bashrc
fi

