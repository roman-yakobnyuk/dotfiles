source $HOME/shell-scripts/git-completion.bash
source $HOME/shell-scripts/git-prompt.sh

function generate_prompt {
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    # regular colors
    local K="\[\033[1;30m\]"    # black
    local R="\[\033[1;31m\]"    # red
    local G="\[\033[1;32m\]"    # green
    local Y="\[\033[1;33m\]"    # yellow
    local B="\[\033[1;34m\]"    # blue
    local M="\[\033[1;35m\]"    # magenta
    local C="\[\033[1;36m\]"    # cyan
    local W="\[\033[1;37m\]"    # white
    local UC=$W                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color

    # fancy colours
    local GREEN="\[\033[38;5;34m\]";
    local RED="\[\033[38;5;124m\]";

    # Default Workdir colour
    local WORKDIR_COLOUR=$W;

    # Check if git repository
    if git branch &>/dev/null; then
      CURRENT_BRANCH_NAME="$(git symbolic-ref HEAD 2>/dev/null)" ||
      CURRENT_BRANCH_NAME="(unnamed branch)"     # detached HEAD
      CURRENT_BRANCH_NAME=${branch_name##refs/heads/}

      # Clean branch colour
      GIT_COLOUR=$NONE;

      # Untracked Files
      local untracked="$(git ls-files -o -d --exclude-standard | sed q | wc -l)";
      if [ $untracked -gt 0 ]
        then
        GIT_COLOUR=$Y;
      fi

      # Unstaged Files
      git diff --quiet HEAD &>/dev/null
      if [ $? == 1 ]
      then
        GIT_COLOUR=$RED;
      fi

      export PS1="$G($GIT_COLOUR$CURRENT_BRANCH_NAME$G)[$W\W$G] $NONE~> "
    else

      export PS1="$G[$W\W$G] $NONE~> "
    fi;

    export PS2="$NONE~> "
}

export PROMPT_COMMAND=generate_prompt

## Aliases ##
# LS command workaround for Mac OS with brew coreutils
alias ls='/usr/local/bin/gls --color -h --group-directories-first -1'

## Node.js ##
# Use local project binaries
export PATH="$PATH:./node_modules/.bin"
