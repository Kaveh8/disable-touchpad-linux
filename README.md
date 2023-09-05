# Disable laptop touchpad/mousepad in Linux
This is a bash script for disabling the laptop touchpad via the command line.

Recently I came across a problem with my laptop's touchpad.
I have installed Pop-os 22.04 on it and the problem is even if I disable my touchpad via GUI or any other tools it still works and causes some problems while typing. 

After some investigation, I did write a script to disable my touchpad and mousepad via the command line, because all other tools were used to disable the touchpad. 
Here is the code:
```bash
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
```

in order to use this on your own laptop do the following steps:
```bash
$ wget [link](https://github.com/Kaveh8/disable-touchpad-linux/blob/main/disable_touchpad.sh)
$ chmod 755 ./disable_touchpad
$ sudo cp ./disable_touchpad /usr/local/bin
```

Now you can disable your touchpad by entering the below command:
```bash
$ disable_touchpad
```
