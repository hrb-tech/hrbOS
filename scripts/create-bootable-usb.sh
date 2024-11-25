#!/bin/bash

# Clone elemental toolkit if not exists
if [ ! -d "elemental-toolkit" ]; then
    git clone https://github.com/rancher/elemental-toolkit.git
fi

cd elemental-toolkit

# Build the OS image
elemental build --config ../config/build.yaml

# Create the bootable ISO
elemental iso --config ../config/build.yaml

# Move ISO to build directory
mv hrbOS.iso ../build/

cd ..

# Print available devices
echo "Available devices:"
lsblk

# Prompt for USB device
read -p "Enter your USB device path (e.g., /dev/sdb): " USB_DEVICE

# Write ISO to USB drive
sudo dd if=build/hrbOS.iso of=$USB_DEVICE bs=4M status=progress oflag=sync
