#!/bin/bash
curl -O https://dl-cdn.alpinelinux.org/alpine/v3.16/releases/x86_64/alpine-standard-3.16.0-x86_64.iso

qemu-img create -f qcow2 docker.qcow2 2T

qemu-system-x86_64 \
	-name alpine-docker \
	-drive file=docker.qcow2,index=0,media=disk,if=virtio \
        -drive file=alpine-standard-3.16.0-x86_64.iso,index=2,media=cdrom \
        -m 8G -smp 4 \
        -fsdev local,id=shared_dev,path=./,security_model=none \
	-device virtio-9p-pci,fsdev=shared_dev,mount_tag=shared_mount

