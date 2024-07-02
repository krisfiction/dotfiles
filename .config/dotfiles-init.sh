#!/usr/bin/env bash

git clone --bare https://github.com/krisfiction/dotfiles.git $HOME/.gitdotfiles

# define dotfiles alias
function dotfiles {
   git --git-dir=$HOME/.gitdotfiles/ --work-tree=$HOME $@
}

# mvp = move + create parents
function mvp () {
    source="$1"
    target="$2"
    target_dir="$(dirname "$target")"
    mkdir --parents $target_dir; mv $source $target
}

# create a directory to backup existing dotfiles to
mkdir -p .gitdotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles from github.com/krisfiction/dotfiles.git";
  else
    echo "Moving existing dotfiles to ~/.gitdotfiles-backup";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mvp {} .gitdotfiles-backup/{}
fi

# checkout dotfiles from repo
dotfiles checkout
dotfiles config status.showUntrackedFiles no
