#!/usr/bin/env bash
git clone --bare https://github.com/krisfiction/dotfiles.git $HOME/.gitdotfiles

#alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

# define dotfiles alias locally since the dotfiles aren't installed on the system yet
function dotfiles {
   git --git-dir=$HOME/.gitdotfiles/ --work-tree=$HOME $@
}

# create a directory to backup existing dotfiles to
mkdir -p .gitdotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles from https://github.com/krisfiction/dotfiles.git";
  else
    echo "Moving existing dotfiles to ~/.gitdotfiles-backup";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .gitdotfiles-backup/{}
fi

# checkout dotfiles from repo
dotfiles checkout
dotfiles config status.showUntrackedFiles no
echo "dotfiles installed"
