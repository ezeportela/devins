#!/usr/bin/env bash

set echo off
sudo echo 'Preparing to install the tools...'

echo 'installing curl...'
sudo apt install curl
echo 'curl has been installed successfully.'

echo 'installing nvm...'
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

. ~/.nvm/nvm.sh
. ~/.profile
. ~/.bashrc

nvm install node
echo 'nvm has been installed successfully.'

echo 'installing git...'
sudo apt install git
echo 'git has been installed successfully.'

echo 'installing postman...'
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -sfn /opt/Postman/Postman /usr/bin/postman
echo 'postman has been installed successfully.'
