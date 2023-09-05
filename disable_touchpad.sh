#!/bin/bash

mouse=$(xinput | grep 'Mouse' | grep -v 'Optical' | cut -f2)
touchpad=$(xinput | grep 'Touchpad' | cut -f2)

disable_mousepad() {
    echo 'Disabling Mouse...' $mouse
    mouse_id=$(echo $mouse | cut -d '=' -f 2)
    mouse_prop_id=$(xinput list-props $mouse_id | grep 'Device Enabled' | cut -d '(' -f 2 | cut -d ')' -f 1)
    echo 'Mouse'$(xinput list-props $mouse_id | grep 'Device Enabled')
    xinput set-prop $mouse_id $mouse_prop_id 0
    echo 'Mouse'$(xinput list-props $mouse_id | grep 'Device Enabled')
    echo 'Mouse Disabled.'
}

disable_touchpad() {
    echo 'Disabling Touch...' $touchpad
    touchpad_id=$(echo $touchpad | cut -d '=' -f 2)
    touchpad_prop_id=$(xinput list-props $touchpad_id | grep 'Device Enabled' | cut -d '(' -f 2 | cut -d ')' -f 1)
    echo 'Touch'$(xinput list-props $touchpad_id | grep 'Device Enabled')
    xinput set-prop $touchpad_id $touchpad_prop_id 0
    echo 'Touch'$(xinput list-props $touchpad_id | grep 'Device Enabled')
    echo 'Touch Disabled.'
}

if [ -z "$mouse" ] && [ -z "$touchpad" ]; then
    echo "No Mousepad/Touchpad Detected."
    set -e
elif [ -z "$mouse" ] && [ ! -z "$touchpad" ]; then
    echo "No Mousepad Detected."
    disable_touchpad
elif [ -z "$touchpad" ] && [ ! -z "$mouse" ]; then
    echo "No Touchpad Detected."
    disable_mousepad
else
    disable_mousepad
    disable_touchpad
fi
