#!/bin/bash
if [[ "$(pwd)" != *vim-install ]]; then
    cd vim-install
fi

if [[ $* =~ *--lite-vimrc* ]]; then
    cp "$(pwd)/vimliterc" "$HOME/.vimrc"
else
    cp "$(pwd)/vimrc" "$HOME/.vimrc"
fi
mkdir -p "$HOME/.vim/pack/my-plugins/start"
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [[ ! $* =~ *--no-mdcat* ]]; then
    git clone https://codeberg.org/flausch/mdcat.git
    apt install cargo
    cd ./mdcat
    cargo install --path .
    echo "Use ,m to preview a markdown file."
fi
vim -c 'PlugInstall --sync' +qa
echo "Type :NERDtree for help with that."
echo "Type :h fzf for help with fzf."
echo "Annnd you're done!"
