#! /bin/sh

## Install basic tools
echo "Installing basic tools..."
sudo apt install git curl gcc -y 

echo "Installing Linux Homebrew..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
 sh -c 'echo "ZSH_THEME="powerlevel10k/powerlevel10k" >> ~/.zshrc'

echo "Downloading Nerd Fonts..."
curl https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/MesloLGS%20NF%20Regular.ttf --output MesloLGSNFRegular.ttf
curl https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/MesloLGS%20NF%20Bold.ttf --output MesloLGSNFBold.ttf
curl https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/MesloLGS%20NF%20Italic.ttf --output MesloLGSNFItalic.ttf
curl https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/MesloLGS%20NF%20Bold%20Italic.ttf --output MesloLGSNFBoldItalic.ttf

echo "Installing Nerd Fonts..."
cp *.ttf ~/.local/share/fonts 

echo "Installing Microsoft Edge Beta..."
## Setup Microsoft Edge Beta
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-beta.list'
sudo rm microsoft.gpg
## Install
sudo apt update
sudo apt install microsoft-edge-beta
