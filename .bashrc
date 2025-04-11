# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# export PATH="$PATH:/app/bin/flatpak/"
# alias pycharm="flatpak run com.jetbrains.PyCharm-Professional"

eval "$(starship init bash)"

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export EDITOR=nvim

# lsd
# alias ls="lsd -F"
# alias la="lsd -AF"
# alias ll="lsd -lF"
# alias lla="lsd -lAF"
# alias lg="lsd -F --group-dirs=first"

export PATH="$PATH:$HOME/.local/opt/node/bin"

fish
# afetch

