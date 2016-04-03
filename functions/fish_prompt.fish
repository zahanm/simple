# Simple
# https://github.com/sotayamashita/simple
#
# MIT © Sota Yamashita

function git_upstream_configured
  git rev-parse --abbrev-ref @"{u}" > /dev/null 2>&1
end

function git_behind_upstream
  test (git rev-list --right-only --count HEAD...@"{u}" ^ /dev/null) -gt 0
end

function git_ahead__upstream
  test (git rev-list --left-only --count HEAD...@"{u}" ^ /dev/null) -gt 0
end

function git_upstream_status
  set -l upsream_status

  if git_upstream_configured
    if git_behind_upstream
      set upsream_status "$upsream_status⇣"
    end

    if git_ahead__upstream
      set upsream_status "$upsream_status⇡"
    end
  end

  echo $upsream_status
end

function print_color
  set -l color  $argv[1]
  set -l string $argv[2]

  set_color $color
  printf $string
  set_color normal
end

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
  set -l pwd_string (echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|')

  echo_color fff "$pwd_glyph"
  echo_color $pwd_color "$pwd_string"


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
    print_color 5DAE8B " $git_upstream_status"
  end

  # Prompt
  #
  print_color FF7676 "\n❯ "
end
