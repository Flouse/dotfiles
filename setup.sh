# Git config
echo "Setup git..."

# backup ~/.gitconfig and copy ./.gitconfig to ~/.gitconfig
if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig.bak
fi
cp ./.gitconfig ~/.gitconfig


function add_aliases {
  echo "Add useful aliases to ~/.bash_aliases"

  cat ./script/rustup >> ~/.bash_aliases

  echo 'alias gs="git status"' >> ~/.bash_aliases
  echo 'alias gp="git pull"' >> ~/.bash_aliases
  echo 'alias gc="git commit"' >> ~/.bash_aliases
  echo 'alias ..="cd .."' >> ~/.bash_aliases
  echo 'alias compose="docker compose"' >> ~/.bash_aliases
}
# Add useful aliases
add_aliases
