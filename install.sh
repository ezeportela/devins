#!/usr/bin/env bash

set echo off
sudo 'Preparing to install...'

# Install common apps
# ============================================
sudo apt install curl git alacarte fonts-firacode -y
# ============================================

# node
# ============================================
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

. ~/.nvm/nvm.sh
. ~/.profile
. ~/.bashrc

nvm install node
# ============================================

# vscode
# ============================================
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm packages.microsoft.gpg

sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y
# ============================================

# postman
# ============================================
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -sfn /opt/Postman/Postman /usr/bin/postman
# ============================================

# zsh
# ============================================
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
. ~/.profile
. ~/.bashrc

sed -i '245c #  prompt_context' ~/.oh-my-zsh/themes/agnoster.zsh-theme

sed -i '11c ZSH_THEME="agnoster"' ~/.zshrc
sed -i '71c plugins=(git colored-man-pages zsh-syntax-highlighting zsh-autosuggestions)' ~/.zshrc

sed -i '$a export NVM_DIR=~/.nvm' ~/.zshrc
sed -i '$a [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' ~/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth 1
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth 1
source ~/.zshrc

chsh -s $(which zsh)
# ============================================
