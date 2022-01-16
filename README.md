### Install oh-my-zsh, custom .zshrc, powerlevel10k theme, and other useful packages
These are 2 bash scripts to fast install some packages to a host machine (particuallyr in TryHackMe.com machines).

I used these scripts to install oh-my-zsh, my .zshrc configuration, powerlevel10k theme, and other useful packages to the Ubuntu & Kali (Linux) machines on TryHackMe.com, I have not tested the scripts with other machines yet.

### My .zshrc configuration
- Theme: powerlevel10k/powerlevel10k (The scripts automatically installed the powerlevel10k official fonts [MesloLGS](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k), but you would need to manually change the font to MesloLGS Regular in your terminal profile).
- Plugins used from $HOME/.oh-my-zsh/plugins/: git sudo web-search dirhistory history jsontools colored-man-pages command-not-found autojump history-substring-search
- Added custom plugins in $HOME/.oh-my-zsh/custom/plugins/: zsh-autosuggestions k zsh-syntax-highlighting

### Other packages
- tilix terminal emulator, tree, neofetch, htop

## Instructions
- You need to clone to ~/Downloads/tryhackme to install Meslo Fonts properly
```bash
git clone https://github.com/Century300/tryhackme.git ~/Downloads/tryhackme && cd ~/Downloads/tryhackme && sudo chmod +x install*
```
- type Y when you see "Do you want to change your default shell to zsh?" when install part 1
```bash
./install_zsh_part1.sh
```
- Install part 2
```bash
./install_zsh_part2.sh
```
- Then source the .zshrc file and remove the clone repository
```bash
source ~/.zshrc
sudo rm -rf ~/Downloads/tryhackme
```
