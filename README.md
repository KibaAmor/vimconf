# vimconf

personal vim configuration.

## How To Use

```bash
mkdir ~/repos
cd ~/repos
git clone https://github.com/kibaamor/vimconf

mv ~/.vimrc ~/.vimrc.bk
echo "source ~/repos/vimconf/vimconf_plug.vim" >> ~/.vimrc
```

## How To Setup Zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i "s@plugins=.*@plugins=($plugins zsh-autosuggestions)@" ~/.zshrc
source ~/.zshrc

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's@ZSH_THEME=.*@ZSH_THEME="powerlevel10k/powerlevel10k"@' ~/.zshrc
source ~/.zshrc
```
