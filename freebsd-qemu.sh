#!/bin/bash
# Download FreeBSD 14 aarch64 disc1 ISO image (rename it to FreeBSD14.iso and move it to /VMs)
# This assumes 64GB RAM (65536) and 8 virtual CPU cores
qemu-system-aarch64 \
    -display default \
    -m 65536 \
    -cpu cortex-a72 -machine virt \
    -smp 8 \
    -bios /usr/share/edk2/aarch64/QEMU_EFI.fd \
    -device qemu-xhci \
    -device usb-kbd \
    -device usb-tablet \
    -device intel-hda \
    -device hda-duplex \
    -drive file=/VMs/HDD.qcow2,if=virtio,cache=writethrough \
    -cdrom /ISOs/FreeBSD14.iso \
    -nographic \
    -serial mon:stdio
