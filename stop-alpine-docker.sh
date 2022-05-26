#!/bin/bash
kill $(ps -ef | grep qemu | grep alpine-docker | tr -s ' ' | cut -d ' ' -f 2)

