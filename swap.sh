#!/bin/bash

if ((`cat /proc/swaps | wc -l` > 1)); then
  echo "The system already has swap pools."
else
  echo "Creating swap pool."
  sudo zfs create -V 16G -b $(getconf PAGESIZE) \
        -o logbias=throughput -o sync=always \
        -o primarycache=metadata \
        -o com.sun:auto-snapshot=false zroot/swap
  sudo mkswap -f /dev/zvol/zroot/swap
  sudo swapon /dev/zvol/zroot/swap
fi

if ((`cat /etc/fstab | rg swap | wc -l` == 1 )); then
  echo "Swap already in fstab."
else
  echo "Writing swap to fstab."
  echo "/dev/zvol/zroot/swap  none  swap  discard 0 0" | sudo tee -a /etc/fstab > /dev/null
fi
