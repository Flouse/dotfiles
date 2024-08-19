#!/bin/bash

# Check if fzf is already installed
if command -v fzf >/dev/null 2>&1; then
  echo "fzf is already installed."
  exit 0
fi

# Install fzf
echo "Installing fzf..."

# Clone the fzf repository
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# Run the install script
~/.fzf/install --key-bindings --completion --update-rc

echo "fzf installation complete!"
