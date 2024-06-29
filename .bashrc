#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='┌──(\u@\h)-[\w]\n└─\$'

export PATH="$HOME/bin:$PATH"

export TERM=xterm-256color




#oh-my-posh setup
#export PATH=$PATH:/home/fiction/bin
POSH_THEME="kali"
eval "$(oh-my-posh init bash --config /home/fiction/.config/oh-my-posh/themes/$POSH_THEME.omp.json)"

# make sure the --git-dir is the same as the  
# directory where you created the repo above.  
alias dotfiles="git --git-dir=$HOME/.gitdotfiles --work-tree=$HOME"
