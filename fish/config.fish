bash ~/.config/zsh/load_plugin.sh

# [fisherman plugins]
# 0rax/fish-bd
# jethrokuan/fzf
# jethrokuan/z
# oh-my-fish/theme-clearance

set -x LANG C
set -x LC_ALL C
set -x TERM xterm-256color
set -x EDITOR vi
set -x LESSCHARSET utf-8

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
alias f='git sync-pub'
alias br='git create-work-branch'
alias b='git post-status'
alias p='git post'
alias ft='git create-feature-branch'
alias rr-major='git release-request major'
alias rr='git release-request minor'
alias rr-patch='git release-request patch'
alias rs='git release-status'
alias rt='git purge; git release-tag'

# docker-wrapper
set -x DOCKER_WRAPPER_WITH_SUDO true
