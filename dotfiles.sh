#!/usr/bin/sh
git clone --separate-git-dir=$HOME/.mydotfiles https://bitbucket.org/udohoffmann/mydotfiles.git /tmp/myconf
alias dotfilesconfig='git --git-dir=$HOME/.mydotfiles/ --work-tree=$HOME'
dotfilesconfig stash
dotfilesconfig work
dotfilesconfig master
rm -rf /tmp/myconf

source ~/.zshrc
dotfiles submodule init
dotfiles submodule update
