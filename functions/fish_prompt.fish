# Simple
# https://github.com/sotayamashita/simple
#
# Color from http://www.colorhunt.co/c/16765
# Prompt from https://github.com/mathiasbynens/dotfiles/blob/master/.bash_prompt
#
# MIT © Sota Yamashita

function fish_prompt -d "Simple Fish Prompt"
  echo -e ""

  # User
  #
  set -l user (id -un $USER)
  echo_color FF7676 "$user"


  # Host
  #
  set -l host_name (hostname -s)
  set -l host_glyph " at "

  echo_color fff "$host_glyph"
  echo_color F6F49D "$host_name"


  # Current working directory
  #
  set -l pwd_glyph " in "
  set -l pwd_color -o 5DAE8B
  set -l pwd_path $PWD

  echo_color fff "$pwd_glyph"
  echo_color $pwd_color "~$pwd_path" | sed -E "~s|$HOME||;s||g;s|g"


  # Git
  #
  if git_is_repo
    set -l branch_name (git_branch_name)
    set -l git_glyph " on "
    set -l git_branch_color -o 466C95
    set -l git_branch_glyph

    echo_color fff "$git_glyph"
    echo_color $git_branch_color "$branch_name"

    # check if there is an upstream
    set -l git_ahead (command git rev-list --left-right --count "HEAD...origin/master" ^ /dev/null | awk '
        $1 > 0 { printf("⇡") } # can push
        $2 > 0 { printf("⇣") } # can pull
    ')

    if test ! -z "$git_ahead"
        echo_color fff "$git_ahead"
    end
  end

  # Prompt
  #
  echo -e ""
  echo_color FF7676 "❯ "

end
