#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


export PATH="$HOME/bin:$PATH"


#oh-my-posh setup
#export PATH=$PATH:/home/fiction/bin
POSH_THEME="kali"
eval "$(oh-my-posh init bash --config /home/fiction/.config/oh-my-posh/themes/$POSH_THEME.omp.json)"

# make sure the --git-dir is the same as the  
# directory where you created the repo above.  
alias dotfiles="git --git-dir=$HOME/.gitdotfiles --work-tree=$HOME"
