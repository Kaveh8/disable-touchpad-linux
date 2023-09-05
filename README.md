# Disable the Laptop Touchpad/Mousepad in Linux
Are you facing issues with your laptop's touchpad persistently working even after disabling it through the graphical user interface (GUI) or other tools on Pop!_OS 22.04? 
Here's a bash script that offers a command-line solution to disable both the touchpad and mousepad effectively.

To implement this solution on your own laptop, follow these steps:

```bash
wget https://github.com/Kaveh8/disable-touchpad-linux/blob/main/disable_touchpad.sh
chmod 755 ./disable_touchpad
sudo mv ./disable_touchpad /usr/local/bin/
```

Now you can disable your touchpad by entering the below command:
```bash
disable_touchpad
```
