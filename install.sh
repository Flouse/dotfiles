#!/bin/bash

set -e

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
  await curl -fsSL https://starship.rs/install.sh | sh

  # Add Starship initialization to ~/.bashrc
  # echo 'eval "$(starship init bash)"' >> ~/.bashrc

  # Reload shell configuration
  # source ~/.bashrc
else
  echo "Starship is already installed."
fi
