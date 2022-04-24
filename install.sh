cp ./.vimrc ~/.vimrc
mkdir -p ~/.vim/pack/my-plugins/start
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/src
cd ~/src
git clone https://codeberg.org/flausch/mdcat.git
apt install cargo
cd ./mdcat
cargo install --path .
echo "Type :NERDtree for help with that."
echo "Type :h fzf for help with fzf."
echo "Use ,m to preview a markdown file."
echo "Now call :PlugInstall in Vim and you're done!"
