#!/bin/bash

set -e

# --- CONFIGURATION ---
DOTFILES_REPO="https://github.com/lucasrodlima/dotfiles.git"

# Official repo packages
PACKAGES=(
  git
  yadm
  fish
  neovim
  curl
  wget
  7zip
  starship
  ghostty
  mpv
  yazi
  npm
  firefox
)

# --- FUNCTIONS ---

install_packages() {
  echo "[*] Updating system and installing official packages..."
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm "${PACKAGES[@]}"
}

clone_dotfiles() {
  if [ -d "$HOME/.local/share/yadm/repo.git" ]; then
    echo "[!] yadm repo already exists. Skipping clone."
  else
    echo "[*] Cloning dotfiles with yadm..."
    cd "$HOME"
    yadm clone "$DOTFILES_REPO"
  fi

  mkdir -p ~/.config/yazi/flavors
  git clone https://github.com/BennyOe/tokyo-night.yazi.git ~/.config/yazi/flavors/tokyo-night.yazi # yazi theme
}

set_shell() {
  echo "[*] Checking current shell..."

  if command -v fish &>/dev/null; then
    local current_shell
    current_shell=$(getent passwd "$USER" | cut -d: -f7)

    echo "[*] Current shell: $current_shell"

    if [[ "$current_shell" != "$(command -v fish)" ]]; then
      echo "[*] Changing default shell to fish..."
      chsh -s "$(which fish)"
      echo "[*] fish set as default shell. You must log out or reboot for the change to take effect."
    else
      echo "[*] fish is already your default shell. No changes made."
    fi
  else
    echo "[!] fish not found in PATH. Skipping shell change."
  fi
}

set_editor_term() {
  echo "[*] Setting EDITOR and TERMINAL in fish config..."
  fish -c 'set -Ux EDITOR nvim'
  fish -c 'set -Ux TERMINAL ghostty'
}

git_setup() {
  git config --global user.name lucasrodlima
  git config --global user.email lucasrodlima27@gmail.com
  git config --global init.defaultBranch main
  git config --global pull.rebase true
}


# --- MAIN ---

echo "==> Starting setup for EndeavourOS..."

install_packages
clone_dotfiles
set_shell
set_editor_term
git_setup

echo "==> Setup completed! Dotfiles are in place."

echo "[*] Opening Firefox to Google login page..."
firefox https://accounts.google.com &

