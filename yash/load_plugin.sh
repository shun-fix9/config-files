load_plugin_main(){
  local bin
  local plugin_dir
  local local_plugin_dir

  load_plugin_setup

  load_plugin_release direnv "https://github.com/direnv/direnv/releases/download/v2.21.2/direnv.linux-amd64" direnv
  load_plugin_release fzf    "https://github.com/junegunn/fzf-bin/releases/download/0.20.0/fzf-0.20.0-linux_amd64.tgz" fzf.tgz

  load_plugin_git "https://github.com" "sanzen-sekai/mypassword"
  load_plugin_git "https://github.com" "getto-systems/key-tuner"
  load_plugin_git "https://github.com" "getto-systems/tmux-wrapper"
  load_plugin_git "https://github.com" "getto-systems/git-pub"
  load_plugin_git "https://github.com" "getto-systems/git-post"
  load_plugin_git "https://github.com" "getto-systems/git-release-request"
  load_plugin_git "https://github.com" "getto-systems/birdfirm"
  load_plugin_git "https://github.com" "getto-systems/docker-wrapper"
  load_plugin_git "https://github.com" "getto-systems/docker-wrapper-commands"

  _load_plugin_bin
}
load_plugin_setup(){
  bin=$HOME/bin
  plugin_dir=$HOME/.plugins
  local_plugin_dir=$HOME/.config/bin

  mkdir -p $bin
}
load_plugin_release(){
  local cmd=$1
  local url=$2
  local output=$3

  if [ -f "$bin/$cmd" ]; then
    return
  fi

  echo "download $cmd..."

  if [ -z "$output" ]; then
    output=$(basename $url)
  fi

  local tmp=/tmp/load_plugin
  mkdir -p $tmp
  cd $tmp

  curl -sL $url --output $output

  case $output in
    *.tar.gz|*.tgz)
      tar -xzf $output
      ;;
  esac

  local dest=$(find . -name $cmd | head -1)
  if [ -z "$dest" ]; then
    echo failed load plugin $cmd
    return
  fi

  chmod a+x $dest
  cp $dest $bin

  cd /
  rm -rf $tmp
}
load_plugin_git(){
  local host=$1
  local repository=$2

  if [ -d $plugin_dir/$repository/.git ]; then
    return
  fi

  echo "clone $repository..."

  mkdir -p $plugin_dir/$repository
  cd $plugin_dir/$repository
  git clone $host/$repository .
}
load_plugin_bin(){
  local bin
  local plugin_dir
  local local_plugin_dir

  load_plugin_setup

  echo "load bin..."
  : $(_load_plugin_bin)
  echo "load finish!"
}
_load_plugin_bin(){
  local file
  local cmd

  cd $bin
  for file in $plugin_dir/*/*/bin/*; do
    if [ -f "$file" ]; then
      cmd=$(basename $file)
      if [ ! -f "$cmd" ]; then
        ln -s $file
      fi
    fi
  done
  for file in $local_plugin_dir/*; do
    if [ -f "$file" ]; then
      cmd=$(basename $file)
      if [ ! -f "$cmd" ]; then
        ln -s $file
      fi
    fi
  done
}

: $(load_plugin_main)
