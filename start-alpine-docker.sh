#!/bin/bash
qemu-system-x86_64 \
	-name alpine-docker \
	-drive file=docker.qcow2,index=0,media=disk,if=virtio \
        -m 8G -smp 4 \
        -fsdev local,id=shared_dev,path=./,security_model=none \
	-device virtio-9p-pci,fsdev=shared_dev,mount_tag=shared_mount \
	-nic user,hostfwd=tcp::60022-:22 \
	-display none \
	-daemonize

