bash ~/.config/zsh/load_plugin.sh

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x TERM xterm-256color
set -x EDITOR vi

set -x PATH $HOME/bin $PATH

eval (direnv hook fish)


# alias
alias docker 'sudo docker'

alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'

alias s='git status-verbose'
alias a='git add -A'
alias ci='git commit -m'
alias br='git create-work-branch'
alias ft='git create-feature-branch'
alias rr-major='git release-request major'
alias rr='git release-request minor'
alias rr-patch='git release-request patch'
alias rs='git release-status'
alias rt='git purge; git release-tag'

# docker-wrapper
set -x DOCKER_WRAPPER_WITH_SUDO true
