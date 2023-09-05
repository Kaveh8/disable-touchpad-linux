#!/bin/bash

mouse=`xinput | grep 'Mouse' | cut -d$'\t' -f2`
touch=`xinput | grep 'Touchpad' | cut -d$'\t' -f2`

echo 'Mouse' $mouse
echo 'Touch' $touch

mouse_id=`echo $mouse | cut -d '=' -f 2`
touch_id=`echo $touch | cut -d '=' -f 2`

mouse_prop_id=`xinput list-props $mouse_id | grep 'Device Enabled' | cut -d '(' -f 2 | cut -d ')' -f 1`
touch_prop_id=`xinput list-props $touch_id | grep 'Device Enabled' | cut -d '(' -f 2 | cut -d ')' -f 1`

echo
echo 'Mouse'`xinput list-props $mouse_id | grep 'Device Enabled'`
echo 'Touch'`xinput list-props $touch_id | grep 'Device Enabled'`

echo 
xinput set-prop $mouse_id $mouse_prop_id 0
xinput set-prop $touch_id $touch_prop_id 0

echo '*****************************************'

echo
echo 'Mouse'`xinput list-props $mouse_id | grep 'Device Enabled'`
echo 'Touch'`xinput list-props $touch_id | grep 'Device Enabled'`
