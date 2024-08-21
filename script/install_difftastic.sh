# https://github.com/Wilfred/difftastic

if command -v difft &> /dev/null
then
  echo "Difftastic is already installed."
else
  # Define the temporary download location
  TEMP_DIR="/tmp"
  DIFTASTIC_VERSION="0.60.0"
  DIFTASTIC_TAR="difft-x86_64-unknown-linux-gnu.tar.gz"

  # Install Difftastic
  FILE_URL="https://github.com/Wilfred/difftastic/releases/download/$DIFTASTIC_VERSION/$DIFTASTIC_TAR"
  echo "Downloading $FILE_URL"
  curl -L $FILE_URL -o "$TEMP_DIR/$DIFTASTIC_TAR"

  echo "Extracting Difftastic..."
  tar -xzf "$TEMP_DIR/$DIFTASTIC_TAR" -C "$TEMP_DIR"

  echo "Moving Difftastic to /usr/local/bin..."
  sudo mv "$TEMP_DIR/difft" /usr/local/bin/
  
  echo "Cleaning up temporary files..."
  rm "$TEMP_DIR/$DIFTASTIC_TAR"

  echo "Difftastic installed successfully."
fi
