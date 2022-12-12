#!/bin/bash
base_git_dir=~/.local/src/configs
files="
~/.bash_aliases
~/.bash_logout
~/.bash_profile
~/.bashrc
~/.dircolors
~/.inputrc
~/.profile
~/.screenrc
~/.tmux.conf
~/.zcompdump
~/.zpath
~/.zprofile
~/.zshenv
~/.zshrc
~/.zshrc.zni
"
for file in $files ;do
  file="${file/#~/$HOME}"
  if [ ! -e $file ];then
    filename=$(basename $file)
    echo "Installing symlink for $file"
    ln -s $base_git_dir/$filename $file
  fi
done

mkdir ~/.local/bin ~/.config -p
ln -s $base_git_dir/bin/credentials-to-env ~/.local/bin/credentials-to-env
. ~/.bashrc

echo Installing Ruby version manager
./rbenv.install.sh

echo Installing Python version manager
./pyenv.install.sh

echo Installing Node.js version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

echo Installing Terraform version manager
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv

echo Installing Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

npm install -g aws-azure-login

echo Installing AWS CLI
./aws.install.sh

./vim.install.sh

echo Please restart terminal.
