#!/bin/bash

yay -S --noconfirm --needed keyd

KEYD_CONF_DIR="/etc/keyd/"
if ! [ -d "$KEYD_CONF_DIR" ]; then
  sudo mkdir $KEYD_CONF_DIR
fi

KEYD_CONF_FILE="/etc/keyd/default.conf"
if ! [ -f "$KEYD_CONF_FILE" ]; then
  sudo tee /etc/keyd/default.conf >/dev/null <<'EOF'
[ids]
*

[main]
# CapsLock acts as Escape on tap, Control on hold
capslock = overload(control, esc)

# (Optional) Map physical Esc to `pause` key so we can later remap it to the XCompose key in `~/.config/hypr/input.conf`
esc = pause
EOF
fi

sudo systemctl enable --now keyd

HYPR_INPUT_CONF_FILE="~/.config/hypr/input.conf"
sudo sed -i "s/kb_options = compose:[^\s]*/kb_options = compose:paus/" ~/.config/hypr/input.conf
hyprctl reload
