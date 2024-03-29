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

  # Reload shell configuration
  # source ~/.bashrc
else
  echo "Starship is already installed."
fi

# How do I uninstall Starship?
# https://starship.rs/faq/#why-don-t-i-see-a-glyph-symbol-in-my-prompt

# https://rustup.rs
await zsh ./script/rustup

# Setup
bash ./setup.sh
