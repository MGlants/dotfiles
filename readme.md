sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply MGlants

or

chezmoi add https://github.com/MGlants/dotfiles.git
chezmoi apply

## Path:
~/.local/share/chezmoi

## Make ZSH as Defaul Shell 
chsh -s $(which zsh)