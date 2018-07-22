#! /usr/bin/env bash
# updates dot-mini

set -euo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"

source "$dir/dotfiles-support"

pull_master() {
  cd "$dir" \
    && git checkout master \
    && git pull origin master
}

update_submodules() {
  cd "$dir" \
    && git submodule sync \
    && git submodule update
}

update() {
  if pull_master && update_submodules ; then
    display_message "Updated"
    display_message "Type 'reload' to reload updates"
    display_message "You may need to logout of the terminal and login for
    changes to take full effect"
  else
    display_message "Update failed"
  fi
}

update
