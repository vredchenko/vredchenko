#!/usr/bin/env bash

# Ref: https://kifarunix.com/install-terraform-on-ubuntu-24-04/

sudo apt update
sudo apt install -y gnupg software-properties-common
wget -qO- https://apt.releases.hashicorp.com/gpg \
| sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/hashicorp-archive-keyring.gpg
echo "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
| sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install -y terraform
terraform -version
