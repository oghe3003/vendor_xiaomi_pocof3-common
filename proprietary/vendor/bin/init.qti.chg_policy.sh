#! /vendor/bin/sh

#
# Copyright (c) 2019-2021 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.
#
# Copyright (c) 2019 The Linux Foundation. All rights reserved.
#

export PATH=/vendor/bin

soc_id=`getprop ro.vendor.qti.soc_id`
<<<<<<< HEAD
if [ "$soc_id" -eq 415 ] || [ "$soc_id" -eq 439 ] || [ "$soc_id" -eq 450 ]; then
=======
if [ "$soc_id" -eq 415 ] || [ "$soc_id" -eq 439 ] || [ "$soc_id" -eq 450 ] || [ "$soc_id" -eq 475 ] || [ "$soc_id" -eq 497 ] || [ "$soc_id" -eq 498 ] || [ "$soc_id" -eq 499 ] || [ "$soc_id" -eq 515 ]; then
>>>>>>> e2b8282... sm8250-common: Update blobs from LA.UM.9.12.r1-13300-SMxx50.QSSI12.0
    setprop persist.vendor.hvdcp_opti.start 2
    exit 0
fi

if [ "$soc_id" -eq 441 ] || [ "$soc_id" -eq 471 ]; then
	#Scuba does not support usb-pd or charge pumps
	find /sys/class/power_supply/battery/ -type f | xargs chown system.system
	find /sys/class/power_supply/bms/ -type f | xargs chown system.system
	find /sys/class/power_supply/main/ -type f | xargs chown system.system
	find /sys/class/power_supply/usb/ -type f | xargs chown system.system
else
	find /sys/class/power_supply/battery/ -type f | xargs chown system.system
	find /sys/class/power_supply/bms/ -type f | xargs chown system.system
	find /sys/class/power_supply/main/ -type f | xargs chown system.system
	find /sys/class/power_supply/usb/ -type f | xargs chown system.system
	find /sys/class/power_supply/charge_pump_master/ -type f | xargs chown system.system
	find /sys/class/power_supply/pc_port/ -type f | xargs chown system.system
	find /sys/class/power_supply/dc/ -type f | xargs chown system.system
	find /sys/class/power_supply/parallel/ -type f | xargs chown system.system
	find /sys/class/usbpd/usbpd0/ -type f | xargs chown system.system
	find /sys/class/qc-vdm/ -type f | xargs chown system.system
	find /sys/class/charge_pump/ -type f | xargs chown system.system
	find /sys/class/qcom-battery/ -type f | xargs chown system.system

	for i in 0 1 2 3 4 5 6 7 8 9
	do
		devname=`cat /sys/bus/iio/devices/iio:device$i/name`
<<<<<<< HEAD
		if [[ "$devname" == *smb* ]] || [[ "$devname" == *qg* ]] || [[ "$devname" == *div2_cp* ]]; then
			find /sys/bus/iio/devices/iio:device$i/ -type f | xargs chown system.system
=======
		if [[ "$devname" == *smb* ]] || [[ "$devname" == *qg* ]] || [[ "$devname" == *div2_cp* ]] || [[ "$devname" == *div2-cp* ]]; then
			find /sys/bus/iio/devices/iio:device$i/ -type f -maxdepth 1 | xargs chown system.system
>>>>>>> e2b8282... sm8250-common: Update blobs from LA.UM.9.12.r1-13300-SMxx50.QSSI12.0
		fi
	done
fi

setprop persist.vendor.hvdcp_opti.start 1
