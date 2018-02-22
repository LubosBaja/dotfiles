#!/bin/bash

# install.sh 
# This script clones the git repo of dotfiles and install them into home dir. 
# In case some of the files exist it will backup the files into .dotfiles-backup directory.

dfDir=$HOME/.dotfiles
bkpDir=$HOME/.dotfiles-backup

git clone --bare https://github.com/LubosBaja/dotfiles.git $dfDir

function config {
    /usr/bin/git --git-dir=$dfDir --work-tree=$HOME $@
}
mkdir -p $bkpDir
config checkout
if [$?=0]; then
    echo "Checked out dotfiles.";
else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $bkpDir/{}
fi;
config checkout
config config status.showUntrackedFiles no
