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

  echo 'alias gl="git logs"' >> ~/.bash_aliases
  echo 'alias gs="git status"' >> ~/.bash_aliases
  echo 'alias gp="git pull"' >> ~/.bash_aliases
  echo 'alias gc="git commit"' >> ~/.bash_aliases
  echo 'alias ..="cd .."' >> ~/.bash_aliases

  # Docker Alias
  echo 'alias compose="docker compose"' >> ~/.bash_aliases
  # TODO: --user (id -u "$USER"):(id -g "$USER")
  # echo "alias zx='docker run --interactive --tty --rm --volume "$PWD":/tmp --workdir /tmp --network=host zx'" >> ~/.bash_aliases
}
# Add useful aliases
add_aliases
