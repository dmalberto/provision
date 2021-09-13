sudo apt update -y && apt upgrade -y
sudo apt install zsh -y
sudo apt install git -y
sudo apt install vim -y
sudo apt install curl -y
sudo apt install wget -y
sudo apt install tmux -y
sudo apt install -y python3-pip
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
sudo apt install -y python3-venv
sudo apt install awscli -y


cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig
cp p10k ~/.p10k.zsh

# docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt -y update
sudo apt -y install docker-ce

# firebase
curl -sL https://firebase.tools | bash

#Font
sudo apt install fonts-firacode -y

# Node
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
chmod 777 ~/.nvm
source ~/.bashrc
nvm install node -y
npm install --global yarn


# zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
chsh -s $(which zsh)
zsh
exit
zsh
source ~/.zshrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# github cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
# # vscode
# apt install snapd
# snap install code --classic

# # git
# curl https://raw.githubusercontent.com/dmalberto/dotfiles/master/.gitconfig -o ~/.gitconfig
