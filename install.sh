#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

backup_path() {
  local target="$1"
  if [ -e "$target" ] || [ -L "$target" ]; then
    local backup="${target}.bak.$(date +%Y%m%d%H%M%S)"
    echo "Backup de $target -> $backup"
    mv "$target" "$backup"
  fi
}

copy_file() {
  local src="$1"
  local dst="$2"

  if [ -f "$src" ]; then
    mkdir -p "$(dirname "$dst")"
    backup_path "$dst"
    cp "$src" "$dst"
    echo "Copiado: $src -> $dst"
  fi
}

copy_dir() {
  local src="$1"
  local dst="$2"

  if [ -d "$src" ]; then
    mkdir -p "$(dirname "$dst")"
    backup_path "$dst"
    cp -r "$src" "$dst"
    echo "Copiado: $src -> $dst"
  fi
}

echo "A criar diretórios..."
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.ssh"

echo "A copiar configs..."

copy_file "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"
copy_file "$REPO_DIR/zsh/.zsh_aliases" "$HOME/.zsh_aliases"

copy_file "$REPO_DIR/git/.gitconfig" "$HOME/.gitconfig"
copy_file "$REPO_DIR/git/.gitconfig-pessoal" "$HOME/.gitconfig-pessoal"
copy_file "$REPO_DIR/git/.gitconfig-worten" "$HOME/.gitconfig-worten"

copy_file "$REPO_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

copy_dir "$REPO_DIR/nvim" "$HOME/.config/nvim"

if [ -f "$REPO_DIR/ssh/config" ]; then
  backup_path "$HOME/.ssh/config"
  cp "$REPO_DIR/ssh/config" "$HOME/.ssh/config"
  chmod 600 "$HOME/.ssh/config"
  echo "Copiado: $REPO_DIR/ssh/config -> $HOME/.ssh/config"
fi

echo "Instalação concluída."
echo "Reabre o terminal ou corre: source ~/.zshrc"
