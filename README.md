# Flouse's public dotfiles

My dotfiles for `MacOS` and `Linux`.

## What is dotfiles?
Dotfiles are files and folders on Unix-like systems starting with `.` prefixed that control the configuration of applications and shells on your system. You can store and manage your dotfiles in a repository on GitHub. For advice and tutorials about what to include in your dotfiles repository, see [GitHub does dotfiles](https://dotfiles.github.io/).


## Principles
No extra tooling, no symlinks,
files are tracked on a version control system,
you can use different branches for different computers,
you can replicate your configuration easily on new installation.


## How to manage the dotfiles
- [Using a bare repository without symlinks](https://github.com/rockyzhang24/dotfiles#-how-i-am-managing-the-dotfiles)


## Rules
[GitHub codespace](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account#dotfiles) or [Gitpod workspace](https://www.gitpod.io/docs/configure/user-settings/dotfiles) will run the first one of the following install scripts to set up the environment.

- install.sh
- install
- bootstrap.sh
- bootstrap
- script/bootstrap
- setup.sh
- setup
- script/setup

If none of these files are found, then any files or folders in your selected dotfiles repository starting with . are symlinked to the codespace's ~ or $HOME directory.


## References
- [Dotfiles: Best Way to Store in a Bare Git Repository](https://www.atlassian.com/git/tutorials/dotfiles)
