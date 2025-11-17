#!/bin/bash

if ! command -v fish &>/dev/null; then
  yay -S --noconfirm --needed omarchy-fish
  omarchy-setup-fish
fi
