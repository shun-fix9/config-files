if [ ! -f ~/.zplug/init.zsh ]; then
  echo "install zplug"
  curl -sSL zplug.sh/installer | TERM=xterm zsh
fi

. ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "direnv/direnv", from:gh-r, as:command, rename-to:direnv

zplug "peco/peco", from:gh-r, as:command, rename-to:peco
zplug 'junegunn/fzf-bin', as:command, from:gh-r, rename-to:fzf

zplug "sanzen-sekai/mypassword", as:command, use:"bin/*"
zplug "sanzen-sekai/git-readme", as:command, use:"bin/*"
zplug "sanzen-sekai/git-sub-status", as:command, use:"bin/*"
zplug "sanzen-sekai/git-pub", as:command, use:"bin/*"
zplug "sanzen-sekai/git-post", as:command, use:"bin/*"
zplug "sanzen-sekai/git-branch-and-post", as:command, use:"bin/*"
zplug "getto-systems/tmux-wrapper", as:command, use:"bin/*"
zplug "getto-systems/git-release-request", as:command, use:"bin/*"
zplug "getto-systems/birdfirm", as:command, use:"bin/*"
zplug "getto-systems/docker-wrapper", as:command, use:"bin/*"
zplug "getto-systems/docker-wrapper-commands", as:command, use:"bin/*"

##
# LOAD
#

# direnv workaround
chmod a+x ~/.zplug/repos/direnv/direnv/*

zplug load

if [ "$(which direnv)" ]; then
  eval "$(direnv hook zsh)"
fi
