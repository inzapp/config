echo 'remove all lines except [user] section in ~/.gitconfig before run this script'
read tmp
mkdir -p ~/.vim/colors/

# use cat instead of cp command due to CRLF, LF changing
cat onehalfdark.vim > ~/.vim/colors/onehalfdark.vim
cat .vimrc > ~/.vimrc
cat .gitconfig >> ~/.gitconfig
echo 'success'
