#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

set -e
set -x

echo ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", GROUP="video", MODE="0664" > /etc/udev/rules.d/backlight.rules

udevadm control --reload-rules
udevadm trigger
