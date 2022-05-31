#!/usr/bin/env bash
set -x
# This initialize the dotfiles
DFDIR=$HOME/dotfiles
mkdir -p ${DFDIR}
cd ${DFDIR}
[ ! -d "${DFDIR}" ] && ( git init && git branch -m main )

## please install stow
type stow > /dev/null 2>&1 || { echo >&2 "Please install stow (e.g. apt install stow). Aborting."; exit 1; }

## Bash
mkdir -p ${DFDIR}/bash
for file in $HOME/.bashrc $HOME/.bash_aliases $HOME/.bash_logout; do
  if [[ -f "$file" && ! -L "$file" ]]; then
    echo "$file is not a symlink"
    echo " ... moving $file";
    mv "$file" "${DFDIR}/bash/"
  fi
done
# find ~/.bash* -type f -name ".bashrc" -o -type f -name ".bash_aliases" -o -type f -name ".bash_logout" -print0 | xargs -t 
# find ~/.bash* -type f -name ".bashrc" -o -type f -name ".bash_aliases" -o -type f -name ".bash_logout" -print0 | xargs mv "$1" ${DFDIR}/bash/
# find ~/.bash* -type f -name ".bashrc" -o -type f -name ".bash_aliases" -o -type f -name ".bash_logout" -print0 | xargs -0 -I {} mv {} ~/dotfiles/bash/
# find ~/.bash* -type f -name ".bashrc" -o -type f -name ".bash_aliases" -o -type f -name ".bash_logout" -exec mv -t ~/dotfiles/bash {} +
cd ${DFDIR}
stow bash

## Zsh
mkdir -p ${DFDIR}/zsh
for file in $HOME/.zshrc; do
  if [[ -f "$file" && ! -L "$file" ]]; then
    echo "$file is not a symlink"
    echo " ... moving $file";
    mv "$file" "${DFDIR}/zsh/"
  fi
done
cd ${DFDIR}
stow zsh

## Git
mkdir -p ${DFDIR}/git
for file in $HOME/.gitconfig; do
  if [[ -f "$file" && ! -L "$file" ]]; then
    echo "$file is not a symlink"
    echo " ... moving $file";
    mv "$file" "${DFDIR}/git/"
  fi
done
cd ${DFDIR}
stow git

# Atom
mkdir -p ${DFDIR}/atom
type apm > /dev/null 2>&1 || { echo >&2 "Please install apm (Atom Package Manager). Aborting."; exit 1; }
apm list --installed --bare > ${DFDIR}/atom/package.list
# And add that file to Git also. To restore, use:
# apm install --packages-file ~/.atom/package.list
for file in $HOME/.atom/config.cson; do
  if [[ -f "$file" && ! -L "$file" ]]; then
    echo "$file is not a symlink"
    echo " ... moving $file";
    mv "$file" "${DFDIR}/atom/"
  fi
done
cd ${DFDIR}
stow --verbose=3 atom -t $HOME/.atom/

## p10k
mkdir -p ${DFDIR}/p10k
for file in $HOME/.p10k.zsh; do
  if [[ -f "$file" && ! -L "$file" ]]; then
    echo "$file is not a symlink"
    echo " ... moving $file";
    mv "$file" "${DFDIR}/p10k/"
  fi
done
cd ${DFDIR}
stow p10k

## fzf
mkdir -p ${DFDIR}/fzf
for file in $HOME/.fzf.zsh; do
  if [[ -f "$file" && ! -L "$file" ]]; then
    echo "$file is not a symlink"
    echo " ... moving $file";
    mv "$file" "${DFDIR}/fzf/"
  fi
done
cd ${DFDIR}
stow fzf

## tmux
# tmux show -g > ~/.tmux.conf
mkdir -p ${DFDIR}/tmux
for file in $HOME/.tmux.conf; do
  if [[ -f "$file" && ! -L "$file" ]]; then
    echo "$file is not a symlink"
    echo " ... moving $file";
    mv "$file" "${DFDIR}/tmux/"
  fi
done
cd ${DFDIR}
stow tmux

## vim
mkdir -p ${DFDIR}/vim
for file in $HOME/.vimrc; do
  if [[ -f "$file" && ! -L "$file" ]]; then
    echo "$file is not a symlink"
    echo " ... moving $file";
    mv "$file" "${DFDIR}/vim/"
  fi
done
cd ${DFDIR}
stow vim
