RaspberryPi
===========

Device: Raspberry Pi 4B 8GB

- Boot from USB.
- Linux with Mate desktop.


## Setup

### Update bootloaer config

- Download RaspberryPi OS Lite from <https://www.raspberrypi.org/downloads/raspberry-pi-os/> and unzip it.
- Insert SD card, run `lsblk -p` to see which devices are currently connected.
- Unmount all SD card partitions with `umount`.

Copying image to the SD card:

```sh
dd bs=4M if=/path/to/your-system.img of=/device/to/your/sd-card status=progress conv=fsync
```

Boot from SD card. (The default user is `pi` , and the password is `raspberry`)

```sh
sudo apt update
sudo apt full-upgrade

sudo sed -i 's/critical/stable/g' /etc/default/rpi-eeprom-update

# choose the latest bin, "pieeprom-2020-07-31.bin" currently.
sudo rpi-eeprom-update -d -f /lib/firmware/raspberrypi/bootloader/stable/pieeprom-2020-07-31.bin

sudo reboot
```

Check:

```sh
vcgencmd bootloader_version
vcgencmd bootloader_config
```

### Install Mate

Copying image to the usb storage, take the sd card out, and then boot from usb.

```sh
sudo raspi-config
```

- Choose "7 Advanced Options", "Memory Split", set to 512.
- Choose "4 Localisation Options" to change locales and keyboard.

```sh
# Change root password
sudo su
passwd

echo 'export PATH=$PATH:/usr/sbin' >> /root/.bashrc

# Add a new normal user
NEW_USER_NAME=<your-username>
groupadd $NEW_USER_NAME
useradd -g $NEW_USER_NAME -d /home/$NEW_USER_NAME -s /bin/bash -m $NEW_USER_NAME
passwd $NEW_USER_NAME

exit

sudo apt install -y mate-core mate-desktop-environment mate-tweak lightdm network-manager-gnome
sudo systemctl disable dhcpcd
sudo /etc/init.d/dhcpcd stop

sudo apt install pulseaudio blueman vim
```

Edit `/usr/share/pulseaudio/alsa-mixer/profile-sets/default.conf`,  and comment out:

```
;[Mapping analog-mono]
;device-strings = hw:%f
;channel-map = mono
;paths-output = analog-output analog-output-lineout analog-output-speaker analog-output-headphones analog-output-headphones-2 analog-output-mono
;paths-input = analog-input-front-mic analog-input-rear-mic analog-input-internal-mic analog-input-dock-mic analog-input analog-input-mic analog-input-linein analog-input-aux analog-input-video analog-input-tvtuner analog-input-fm analog-input-mic-line analog-input-headset-mic
;priority = 7
```

```sh
sudo raspi-config
```

- Choose "3 Boot Options" to boot directly into the gui at boot time.

`/boot/config.txt`

Find the section of the file that starts with `[pi4]` and paste the following settings:

```
over_voltage=6
arm_freq=2000
gpu_freq=750
```

```sh
sudo reboot
```


## References

- [Installing operating system images on Linux](https://www.raspberrypi.org/documentation/installation/installing-images/linux.md)
- [Pi 4 Bootloader Configuration](https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711_bootloader_config.md#usbmassstorageboot)
- [Steps for Configuring Mate Desktop on 4GB Raspberry Pi 4B](https://www.raspberrypi.org/forums/viewtopic.php?t=260974)
