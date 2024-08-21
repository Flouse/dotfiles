# Git config
echo "Setup git..."

# backup ~/.gitconfig and copy ./.gitconfig to ~/.gitconfig
if [ -f ~/.gitconfig ]; then
  
  mv ~/.gitconfig ~/.gitconfig.bak
fi
cp ./.gitconfig ~/.gitconfig
