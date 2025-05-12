#!/bin/sh

# Colors
blue="#83a598"
green="#b8bb26"
orange="#d65d0e"
yellow="#fabd2f"
white="#fbf1c7"
gray="#3c3836"
black="#282828"

calendar() {
 printf "^b$yellow^^c$black^  ^b$gray^ ^c$white^ $(date "+%A %B %d") ^d^"
}
clock() {
 printf "^b$blue^^c$black^ 󱑂 ^b$gray^ ^c$white^ $(date "+%H:%M") ^d^"
}

memory() {
 printf "^b$orange^^c$black^  ^b$gray^^c$white^ $(free -h | awk '/Mem:/ {print $7}') ^d^"
}

battery() {
 left=$(acpi -b | grep -o '[0-9]\+%')
 printf "^b$green^^c$black^  ^b$gray^^c$white^ $left% ^d^"
}

while true; do
 xprop -root -set WM_NAME " $(battery) $(memory) $(calendar) $(clock)"
	sleep 1m
done
