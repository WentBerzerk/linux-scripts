#!/bin/sh

VPN=$(ifconfig | grep -c "tun0")

if [ "$VPN" = 1 ]; then
    echo "VPN: ^c#8ac926^󰅡 ^d^"
else
    echo "VPN: 󰅡 "
fi
