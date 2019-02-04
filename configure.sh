#!/usr/bin/env bash

CYAN='\033[0;36m'
NC='\033[0m'

# Install Prerequisite apt packages
echo -e "${CYAN}Installing prerequsite packages${NC}"
sudo apt install fonts-font-awesome zsh git fonts-powerline wget python3 libglib2.0-0 libgl1 libfontconfig1 libx11-xcb1 libxi6 libxrender1 libdbus-1-3 tox asciidoc silversearcher-ag

# Copying .gitconfig into home directory
echo -e "${CYAN}Symlinking .gitconfig to home directory${NC}"
ln -svf `pwd`/.gitconfig $HOME/.gitconfig

# Copy vimrc into home folder
echo -e "${CYAN}Symlinking .vimrc to home directory${NC}"
ln -svf `pwd`/.vimrc $HOME/.vimrc

# Install vim plugins
vim -c PlugInstall -c q -c q

# Set default shell to zsh
echo -e "${CYAN}Changing shell to zsh${NC}"
chsh -s $(which zsh)

# Install Oh My Zsh
echo -e "${CYAN}Installing Oh My Zsh${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -B)"

# Copy over .zshrc
echo -e "${CYAN}Symlinking .zshrc to home directory${NC}"
ln -svf `pwd`/.zshrc $HOME/.zshrc

# Copy over .rosrc
echo -e "${CYAN}Symlinking .zshrc to home directory${NC}"
ln -svf `pwd`/.rosrc $HOME/.rosrc

