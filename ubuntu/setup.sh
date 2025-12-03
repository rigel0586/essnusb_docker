#!/bin/bash

# Upgrade
sudo apt update && sudo apt upgrade -y

# Ensure prerequisites
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Step 1: Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Step 2: Add Docker’s official APT repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

# Step 3: Install Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Step 4: Install code
wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install ./vscode.deb

# Install docker extensions for vs code
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode.remote-server
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode.remote-explorer
code --install-extension ms-vscode-remote.remote-wsl

docker pull rigelessnusb/essnusb:latest
#docker run -it rigelessnusb/essnusb:latest

#install for root extensions (docker may run under root)
sudo code --install-extension ms-azuretools.vscode-docker
sudo code --install-extension ms-vscode-remote.remote-containers
sudo code --install-extension ms-vscode-remote.remote-containers
sudo code --install-extension ms-vscode-remote.remote-ssh
sudo code --install-extension ms-vscode-remote.remote-ssh
sudo code --install-extension ms-vscode.remote-server
sudo code --install-extension ms-vscode-remote.vscode-remote-extensionpack
sudo code --install-extension ms-vscode.remote-explorer
sudo code --install-extension ms-vscode-remote.remote-wsl
