#!/bin/bash

set -e

dotfiles_dir="$(
  cd "$(dirname "$0")"
  pwd
)"
cd "$dotfiles_dir"

if [ "$(id -u)" -eq 0 ]; then
  bin_dir="/usr/local/bin"
else
  bin_dir="$HOME/.local/bin"
  # Ensure the bin directory exists
  mkdir -p "$bin_dir"

  # Add bin_dir to PATH in ~/.bashrc if not already present
  if ! grep -q "export PATH=\"$bin_dir:\$PATH\"" ~/.bashrc && [[ ":$PATH:" != *":$bin_dir:"* ]]; then
    echo "export PATH=\"$bin_dir:\$PATH\"" >> ~/.bashrc
  fi
fi

function await {
  $@ &
  local pid=$!
  wait $pid
  local exit_code=$?

  if [ $? -ne 0 ]; then
    echo "Failed to execute $@"
    exit $exit_code
  fi
}

# Check if Starship is installed
if ! command -v starship &> /dev/null; then
  # Install Starship
  echo "Installing starship"
  await curl -fsSL https://starship.rs/install.sh | sh -s -- --bin-dir $bin_dir -y

  # Add Starship initialization to ~/.bashrc
  echo 'eval "$(starship init bash)"' >> ~/.bashrc
else
  echo "Starship is already installed."
fi

# How do I uninstall Starship?
# https://starship.rs/faq/#why-don-t-i-see-a-glyph-symbol-in-my-prompt

# Install fzf using the standard install script
# See https://andrew-quinn.me/fzf/
await ./script/install_fzf.sh

# Install https://github.com/Wilfred/difftastic
await ./script/install_difftastic.sh $bin_dir

# Setup
await ./setup.sh
