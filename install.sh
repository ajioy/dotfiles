#!/bin/bash

# author: Ajioy (ajioy@hotmail.com)
BASEPATH=$(dirname $0)
cd ./${BASEPATH}
CURRENT_DIR=$(pwd)   # get absolutly path" 

echo "Step0: backup current dotfiles"
today=`date +%Y%m%d%s`
# if dotfiles exist, then backup them.
for i in $HOME/.bashrc $HOME/.tmux.conf $HOME/.Xresources $HOME/.fonts $HOME/.bin; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
# if link exists, then unlink it 
for i in $HOME/.bashrc $HOME/.tmux.conf $HOME/.Xresources $HOME/.fonts $HOME/.bin; do [ -L $i ] && unlink $i; done

echo "Step1: link dotfiles to home path"
lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

lnif $CURRENT_DIR/.bashrc $HOME/.bashrc
lnif $CURRENT_DIR/.tmux.conf $HOME/.tmux.conf
lnif $CURRENT_DIR/.Xresources $HOME/.Xresources
lnif $CURRENT_DIR/.bin $HOME/.bin
lnif $CURRENT_DIR/.fonts $HOME/.fonts

echo "Step2: adjust premission"
chmod u+x -R $CURRENT_DIR
source $HOME/.bashrc # it seems doesn't work


echo "Step3: install tmux"
apt-get install tmux -y

echo "Step4: install autojump"
git clone git://github.com/wting/autojump.git && $CURRENT_DIR/install.py

echo "Step5: install fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install


echo "all is down"
