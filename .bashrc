#
# ~/.bashrc
#
# Last Update: 2024-06-29


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias upgrade-posh='curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin'

alias reload='source ~/.bashrc'


#PS1='[\u@\h \W]\$ '
PS1='┌──(\u@\h)-[\w]\n└─\$'

#export PATH="$HOME/bin:$PATH"

#export TERM=xterm-256color

export VISUAL=nvim;
export EDITOR=nvim;



#oh-my-posh setup
export PATH=$PATH:/home/fiction/bin
POSH_THEME="kali"
eval "$(oh-my-posh init bash --config /home/fiction/.config/oh-my-posh/themes/$POSH_THEME.omp.json)"

# alias for dotfiles
alias dotfiles="git --git-dir=$HOME/.gitdotfiles --work-tree=$HOME"
