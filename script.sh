#!/bin/bash

# Atualização do sistema
sudo apt update -y && sudo apt upgrade -y

# Instalação de ferramentas essenciais
sudo apt install -y git curl wget tmux vim zsh build-essential libssl-dev libffi-dev python3-dev python3-pip python3-venv apt-transport-https ca-certificates software-properties-common default-jre

# Configurações personalizadas
cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig
cp p10k ~/.p10k.zsh

# AWS CLI
sudo apt install -y awscli

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update -y
sudo apt install -y docker-ce

# Firebase CLI
curl -sL https://firebase.tools | bash

# Node.js e Yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source $NVM_DIR/nvm.sh
nvm install node
npm install --global yarn

# Zsh e Oh My Zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://git.io/zinit-install)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
chsh -s $(which zsh)
source ~/.zshrc

# Vim e Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update -y
sudo apt install -y gh

# Visual Studio Code
# sudo apt install -y snapd
# sudo snap install code --classic

# Configuração do nvm
source ~/.nvm/nvm.sh

# Limpeza
sudo apt autoremove -y
sudo apt clean

echo "Configuração concluída!"
