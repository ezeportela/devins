#!/usr/bin/env bash

set echo off
sudo echo 'Preparing to install the tools...'

echo 'installing curl...'
sudo apt install curl
echo 'curl has been installed successfully.'

echo 'installing git...'
sudo apt install git
echo 'git has been installed successfully.'

echo 'installing zsh...'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'zsh has been installed successfully.'

echo 'installing nvm...'
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

. ~/.nvm/nvm.sh
. ~/.profile
. ~/.bashrc

nvm install node
echo 'nvm has been installed successfully.'

echo 'installing vscode...'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm packages.microsoft.gpg

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code
echo 'vscode has been installed successfully.'

echo 'installing postman...'
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -sfn /opt/Postman/Postman /usr/bin/postman
echo 'postman has been installed successfully.'
