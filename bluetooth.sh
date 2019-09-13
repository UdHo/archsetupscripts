#!/usr/bin/sh
yay -S bluez-tools
systemctl start bluetooth.service
systemctl enable bluetooth.service
sudo sed -i "s/#\?AutoEnable=[a-z]*$/AutoEnable=true /g" /etc/bluetooth/main.conf

echo "load-module module-bluetooth-policy\n load-module module-bluetooth-discover" | sudo tee "/etc/pulse/system.pa"

echo 'SUBSYSTEM=="bluetooth", ACTION=="add", RUN+="/home/udo/.config/scripts/bt-auto-enable-a2dp.sh"' | sudo tee "/etc/udev/rules.d/20-bt-auto-enable-a2dp.rules" 

