#!/bin/bash

# Ensure TestDisk is installed
if ! command -v testdisk &> /dev/null
then
    echo "TestDisk could not be found, installing..."
    sudo pacman -Syu   #sudo apt update
    sudo pacman -Sy testdisk #sudo apt install -y testdisk
fi

# Path to the SD card device
SD_CARD_DEV="/dev/sdb"  # Replace with your SD card device, e.g., /dev/sdb

# Directory to save recovered files
RECOVERY_DIR="$HOME/recovered_files"
mkdir -p $RECOVERY_DIR

# Run TestDisk
sudo testdisk /log /dev/sdb << EOF
y
P
${SD_CARD_DEV}
y
${RECOVERY_DIR}
EOF

echo "Recovery completed. Check $RECOVERY_DIR for recovered files."
