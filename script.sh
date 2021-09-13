sudo apt update -y && apt upgrade -y
sudo apt install zsh -y
sudo apt install git -y
sudo apt install vim -y
sudo apt install curl -y
sudo apt install wget -y
sudo apt install tmux -y
cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig

#Font
sudo apt install fonts-firacode -y

# Node
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
chmod 777 ~/.nvm
source ~/.bashrc
nvm install node -y

# zsh
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

# # vscode
# apt install snapd
# snap install code --classic

# # git
# curl https://raw.githubusercontent.com/dmalberto/dotfiles/master/.gitconfig -o ~/.gitconfig
