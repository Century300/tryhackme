#!/bin/bash

# Detect machine
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)     MACHINE=Linux;;
  Darwin*)    MACHINE=Mac;;
  CYGWIN*)    MACHINE=Cygwin;;
  MINGW*)     MACHINE=MinGw;;
  *)          MACHINE="UNKNOWN:${unameOut}"
esac

echo "Your machine is" __$MACHINE'''__, I used these scripts to install oh-my-zsh, ~/.zshrc configuration, powerlevel10k theme, and other useful packages to the Ubuntu & Kali (Linux) machines on TryHackMe.com, I have not tested the scripts with other machines yet.  You might want to run "sudo apt upgrade -y" after running this 2nd bash script, but it might take a long time to upgrade all packages.'''

# Assumes default ZSH installation
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Install additional custom plugins zsh-autosuggestions, k, zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fix permission
chmod 700 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Debian dependencies to use the pluggins later
sudo apt install -y zsh-syntax-highlighting autojump zsh-autosuggestions

# Clone the powerlevel10k repository to oh-my-zsh directory
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install other useful packages
  # tree - list contents of directories in a tree-like format.
  sudo apt install tree -y
  # Neofetch - A fast, highly customizable system info script
  sudo apt install neofetch -y
  # htop - interactive process viewer
  sudo apt install htop -y
  
# Replace the OMZ default $HOME/.zshrc file with this .zshrc content
echo '''
# Path to oh-my-zsh installation
export ZSH="/$HOME/.oh-my-zsh"

#Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

#Plugins
plugins=(
    #plugins in $HOME/.oh-my-zsh/plugins/
    git sudo web-search dirhistory history jsontools colored-man-pages command-not-found autojump
    #other plugins in $HOME/.oh-my-zsh/custom/plugins/
    zsh-autosuggestions k zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh
''' > $HOME/.zshrc

 # Run neofetch to see system information
 neofetch

echo '''If you see this line, the installation is successful. If you are already in zsh, please type "source ~/.zshrc" into the terminal or exit & re-open the terminal to see the new zsh customization. If not, you need to type "zsh" to start Z shell first.'''
