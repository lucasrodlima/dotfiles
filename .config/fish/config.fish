if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Generated for envman. Do not edit.
# test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

starship init fish | source

set fish_greeting

# lsd
alias ls "lsd -F"
alias la "lsd -AF"
alias ll "lsd -lF"
alias lla "lsd -lAF"
alias lg "lsd -F --group-dirs=first"



function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
