#!/usr/bin/sh
yay -S zfs-auto-snapshot

systemctl enable zfs-auto-snapshot-hourly.timer
systemctl start zfs-auto-snapshot-hourly.timer
systemctl enable zfs-auto-snapshot-daily.timer
systemctl start zfs-auto-snapshot-daily.timer
systemctl enable zfs-auto-snapshot-weekly.timer
systemctl start zfs-auto-snapshot-weekly.timer
systemctl enable zfs-auto-snapshot-monthly.timer
systemctl start zfs-auto-snapshot-monthly.timer
