#!/bin/bash

APPLE_KB_CONFIG_FILE="/etc/modprobe.d/hid_apple.conf"

if ! [ -f "$APPLE_KB_CONFIG_FILE" ]; then
  echo "hid_apple.conf file was not found - no changes will be made"
  exit 1
fi

# change fn config so fn buttons are secondary func (e.g. play/pause) instead of F8
sudo sed -i "s/options hid_apple fnmode=2/options hid_apple fnmode=1/" "$APPLE_KB_CONFIG_FILE"

# reloadthe bootloader
sudo limine-mkinitcpio

# reboot
