#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "A criar estrutura..."
mkdir -p "$REPO_DIR/zsh"
mkdir -p "$REPO_DIR/git"
mkdir -p "$REPO_DIR/starship/.config"
mkdir -p "$REPO_DIR/ssh"

echo "A fazer backup das configs..."

[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$REPO_DIR/zsh/.zshrc"
[ -f "$HOME/.zsh_aliases" ] && cp "$HOME/.zsh_aliases" "$REPO_DIR/zsh/.zsh_aliases"

[ -f "$HOME/.gitconfig" ] && cp "$HOME/.gitconfig" "$REPO_DIR/git/.gitconfig"
[ -f "$HOME/.gitconfig-pessoal" ] && cp "$HOME/.gitconfig-pessoal" "$REPO_DIR/git/.gitconfig-pessoal"
[ -f "$HOME/.gitconfig-worten" ] && cp "$HOME/.gitconfig-worten" "$REPO_DIR/git/.gitconfig-worten"

[ -f "$HOME/.config/starship.toml" ] && cp "$HOME/.config/starship.toml" "$REPO_DIR/starship/starship.toml"

#backup nvim configs
if [ -d "$HOME/.config/nvim" ]; then
  rm -rf "$REPO_DIR/nvim"
  cp -r "$HOME/.config/nvim" "$REPO_DIR/"
fi

if [ -f "$HOME/.ssh/config" ]; then
  cp "$HOME/.ssh/config" "$REPO_DIR/ssh/config"
fi

echo "Backup concluído."
echo "Próximos passos:"
echo "  git status"
echo "  git add ."
echo "  git commit -m 'update dotfiles'"
echo "  git push"
