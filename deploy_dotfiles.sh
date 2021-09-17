if  [ ! -x "$HOME/.local/bin/sheldon" ]; then
    echo "Installing sheldon"
    mkdir -p "$HOME/.local/bin"
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
fi
if [ ! -x "$HOME/.local/bin/chezmoi" ]; then
    echo "Installing chezmoi"
    mkdir -p "$HOME/.local/bin"
    curl -sfL https://git.io/chezmoi -o /tmp/chezmoi.sh
    chmod +x /tmp/chezmoi.sh
    /tmp/chezmoi.sh -b "$HOME/.local/bin" -d
    rm /tmp/chezmoi.sh
fi
if [ ! -d "$HOME/.local/share/chezmoi/.git" ]; then
    mkdir -p "$HOME/.vim/backup"
    echo "Installing dotfiles …"
    cd "$HOME" || exit
    "$HOME/bin/chezmoi" init --apply --verbose https://git.sysnove.net/MGlants/dotfiles
    echo "Installing dotfiles completed"
else
    echo "Chezmoi upgrade"
    "$HOME/.local/bin/chezmoi" upgrade
    echo "Chezmoi upgrade dotfiles"
    "$HOME/.local/bin/chezmoi" update -v
    echo "ZSH Plugins upgrade"
    "$HOME/.local/bin/sheldon" lock --update
    mkdir -p "$HOME/.vim/backup"
fi
if ! [ -x "$HOME/.local/bin/starship" ]; then
    echo "Installing starship"
    mkdir -p "$HOME/bin"
    curl -sfL https://starship.rs/install.sh -o /tmp/install.sh
    chmod +x /tmp/install.sh
    /tmp/install.sh -y -b "$HOME/.local/bin"
    rm /tmp/install.sh
fi