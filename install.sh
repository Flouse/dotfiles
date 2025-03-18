#!/bin/bash

set -e

dotfiles_dir="$(
    cd "$(dirname "$0")"
    pwd
)"
cd "$dotfiles_dir"

function await {
  $@ &
  local pid=$!
  wait $pid

  if [ $? -ne 0 ]; then
    echo "Failed to execute $@"
    exit $?
  fi
}

# Check if Starship is installed
if ! command -v starship &> /dev/null; then
  # Install Starship
  echo "Installing starship"
  await curl -fsSL https://starship.rs/install.sh | sh -s -- -y

  # Add Starship initialization to ~/.bashrc
  echo 'eval "$(starship init bash)"' >> ~/.bashrc
else
  echo "Starship is already installed."
fi

# How do I uninstall Starship?
# https://starship.rs/faq/#why-don-t-i-see-a-glyph-symbol-in-my-prompt

# https://rustup.rs
await ./script/rustup

# Install fzf using the standard install script
# See https://andrew-quinn.me/fzf/
bash ./script/install_fzf.sh

# Install https://github.com/Wilfred/difftastic
bash ./script/install_difftastic.sh

# Setup
bash ./setup.sh
