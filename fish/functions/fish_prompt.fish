# name: clearance
# ---------------
# Based on idan. Display the following bits on the left:
# - Virtualenv name (if applicable, see https://github.com/adambrenecki/virtualfish)
# - Current directory name
# - Git branch and dirty state (if inside a git repo)

function _git_branch_name
  echo (command git symbolic-ref --short HEAD ^/dev/null)
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _git_stash_count
  echo (command git stash list ^/dev/null | wc -l)
end

function _git_wip_branch_count
  echo (command git branch ^/dev/null | grep -v master | grep -v "^*" | wc -l)
end

function _tmux_window_name
  if set -q TMUX_WINDOW_NAME
    echo "$TMUX_WINDOW_NAME"
  else
    if set -q APP_ROOT
      echo (command basename "$APP_ROOT" ^/dev/null)
    else
      echo 'EXTRA'
    end
  end
end

function fish_prompt
  set -l last_status $status

  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set -l cwd $blue(pwd | sed "s:^$HOME:~:")

  # Output the prompt, left to right

  # Add a newline before new prompts
  echo -e ''

  # Print pwd or full path
  echo -n -s $cwd $normal

  # Show git branch and status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info $yellow $git_branch "(*)" $normal
    else
      set git_info $cyan $git_branch $normal
    end

    if [ (_git_wip_branch_count) = "0" ]
      set git_wip_info ""
    else
      set -l git_wip_branch_count (_git_wip_branch_count)
      set git_wip_info $yellow " (branch +" $git_wip_branch_count ")" $normal
    end

    if [ (_git_stash_count) = "0" ]
      set git_stash_info ""
    else
      set -l git_stash_count (_git_stash_count)
      set git_stash_info $yellow " (stash +" $git_stash_count ")" $normal
    end

    echo -n -s ' -> ' $git_info $git_wip_info $git_stash_info $normal
  end

  set -l prompt_color $red
  if test $last_status = 0
    set prompt_color $normal
  end

  # Terminate with a nice prompt char
  echo -e ''
  echo -e -n -s $prompt_color '> ' $normal

  # set tmux window name
  tmux rename-window (_tmux_window_name) ^/dev/null
end
