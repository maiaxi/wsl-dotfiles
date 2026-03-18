#!/usr/bin/env bash
set -euo pipefail

echo "A instalar packages base..."

sudo pacman -S --needed \
  zsh \
  git \
  neovim \
  tmux \
  starship \
  fzf \
  eza \
  bat \
  ripgrep \
  fd \
  zoxide \
  fastfetch \
  lazygit \
  tree-sitter-cli \
  base-devel \
  curl \
  wget \
  unzip \
  openssh \
  less \
  man-db \
  man-pages \
  github-cli \
  nano

echo "A instalar Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "A instalar plugins do Zsh..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/you-should-use" ]; then
  git clone https://github.com/MichaelAquilina/zsh-you-should-use \
    "$ZSH_CUSTOM/plugins/you-should-use"
fi

echo "A definir zsh como shell default..."
if [ "${SHELL:-}" != "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi

echo "Dependências instaladas."
echo "Depois corre ./install.sh"
