#!/bin/bash
if [[ "$(pwd)" != *vim-install ]]; then
    cd vim-install
fi

cp "$(pwd)/vimrc" "$HOME/.vimrc"
mkdir -p "$HOME/.vim/pack/my-plugins/start"
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir "$HOME/src"
cd "$HOME/src"
git clone https://codeberg.org/flausch/mdcat.git
apt install cargo
cd ./mdcat
cargo install --path .
echo "Type :NERDtree for help with that."
echo "Type :h fzf for help with fzf."
echo "Use ,m to preview a markdown file."
echo "Now call :PlugInstall in Vim and you're done!"
