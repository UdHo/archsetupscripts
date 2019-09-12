#!/usr/bin/sh
interface = wlp2s0

systemctl enable netctl-auto@$interface.service
