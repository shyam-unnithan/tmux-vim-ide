#!/bin/bash

# Check if zsh has been installed else
# install zsh 
if ! [ -x "$(command -v zsh)" ]; then
  echo 'Message: zsh is not installed. Installing now...' >&2
  sudo apt-get -y install zsh
fi

# Check to see if zsh is the default
# shell if not change default shell
# to zsh
if [ $SHELL != "/usr/bin/zsh" ];
then
	chsh -s /usr/bin/zsh
fi

# Check if curl has been installed else
# install curl 
if ! [ -x "$(command -v curl)" ]; then
  echo 'Message: curl is not installed. Installing now...' >&2
  sudo apt-get -y install curl
fi

# Check if git has been installed else
# install git 
if ! [ -x "$(command -v git)" ]; then
  echo 'Message: git is not installed. Installing now...' >&2
  sudo apt-get -y install git 
fi

# Check if tmux has been installed else
# install tmux
if ! [ -x "$(command -v tmux)" ]; then
  echo 'Message: tmux is not installed. Installing now...' >&2
  sudo apt-get -y install tmux 
fi

# Install Oh-My-ZSH
echo 'Message: Installing oh-my-zsh' >&2
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Check if Fuzzy Search is installed else install
if ! [ -x "$(command -v fzf)" ]; then
  echo 'Message: Fuzzy Search is not installed. Installing now...'>&2
  sudo apt-get install -y fzf
fi

# Checkout our repo to home folder
cd
git clone https://github.com/shyam-unnithan/tmux-vim-ide.git

# Let us install oh-my-tmux from gpakosz
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf

# Replace the file .tmux.conf.local from gpakosz
# with the one from our repo
cp -rf ~/shyam-unnithan/tmux-vim-ide/tmux-conf/.tmux.conf.local ~/.tmux.conf.local

# Copy the .vimrc from our repo
cp -rf ~/tmux-vim-ide/vimrc/.vimrc ~/

# Install dependencies for YouCompleteMe
sudo apt-get -y install  build-essential cmake python3-dev

# Install powerline fonts
sudo apt-get -y install fonts-powerline

# Show Message to start vi and then post that install YouCompleteMe
echo 'Please perform the following'>&2
echo '1) Run vi command'
echo '2) Once plugins are downloaded. Traverse to ~/.vim/plugged/YouCompleteme and tigger install.sh'
echo 'Once the above steps are complete, your tmux-vim-ide should be ready and kicking!'
