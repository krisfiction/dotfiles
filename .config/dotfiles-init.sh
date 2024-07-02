#!/usr/bin/env bash

git clone --bare https://github.com/krisfiction/dotfiles.git $HOME/.gitdotfiles

# define dotfiles alias
function dotfiles {
   git --git-dir=$HOME/.gitdotfiles/ --work-tree=$HOME $@
}

echo "this is a test"

# create a directory to backup existing dotfiles to
mkdir -p .gitdotfiles-backup
mkdir .gitdotfiles-backup/.config/i3
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles from github.com/krisfiction/dotfiles.git";
  else
    echo "Moving existing dotfiles to ~/.gitdotfiles-backup";
    #dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .gitdotfiles-backup/{}
    dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .gitdotfiles-backup/{}
fi

# checkout dotfiles from repo
dotfiles checkout
dotfiles config status.showUntrackedFiles no
