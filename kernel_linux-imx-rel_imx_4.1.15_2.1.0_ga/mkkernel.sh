#!/bin/sh

# 目标路径定义
DIRECTORY=~/srv/tftp

echo target file path: ${DIRECTORY}

# 创建文件夹
if [ ! -d ${DIRECTORY}/kernel ]; then
	echo "target kernel directory not exist, created!"
	mkdir -p ${DIRECTORY}/kernel
fi

#创建分区文件
if [ ! -e ${DIRECTORY}/kernel.vfat ]; then
	echo "kernel.vfat not exist, created!"
	dd if=/dev/zero of=${DIRECTORY}/kernel.vfat bs=1024 count=16384 #16MB size
	mkfs.vfat ${DIRECTORY}/kernel.vfat
fi

#制作vfat镜像
sudo mount -o loop ${DIRECTORY}/kernel.vfat ${DIRECTORY}/kernel
sudo rm -rf ${DIRECTORY}/kernel/*
sudo cp arch/arm/boot/zImage ${DIRECTORY}/kernel
sudo cp arch/arm/boot/dts/imx6ul-topeet.dtb ${DIRECTORY}/kernel
sudo umount ${DIRECTORY}/kernel
echo "make kernel.vfat succussful!"
