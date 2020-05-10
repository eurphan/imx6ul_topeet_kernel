#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

make imx6ul_topeet_defconfig
make uImage LOADADDR=0x10008000 -j4
make imx6ul-topeet.dtb
make imx6ul-topeet-1280x800.dtb
