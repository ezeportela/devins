sudo apt install -y python3-pip
sudo apt install -y python3-venv
echo 'alias py=python3' >> ~/.zshrc
echo 'alias install_pyenv="python3 -m venv venv"' >> ~/.zshrc
echo 'alias pyenv="source venv/bin/activate"' >> ~/.zshrc
echo 'alias upyenv="deactivate"' >> ~/.zshrc
