#!/bin/sh

TARGET_PATH=~/srv/tftp

echo "copying kernel image..."

if [ ! -d ${TARGET_PATH} ]; then
	echo "target path not exist, created!, "
	mkdir -p ${TARGET_PATH}
fi
cp arch/arm/boot/dts/imx6ul-topeet.dtb ${TARGET_PATH}
cp arch/arm/boot/zImage ${TARGET_PATH}
