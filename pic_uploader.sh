#!/bin/bash
# This script takes a bunch of frames an uploads the last one to the server

PEM=/home/detlev/.ssh/lightsail.pem
SERVER=wotah.detlevcasanova.be
DATE=$(date +%Y%m%d%H%M%S)

# Take a bunch of pics
gst-launch-1.0 v4l2src device=/dev/video0 num_buffers=50 ! \
    video/x-raw,format=YUY2,width=1280,height=720 ! \
    videoconvert ! \
    jpegenc ! \
    filesink "location=/tmp/${DATE}.jpeg" || true

scp -i ${PEM} /tmp/${DATE}.jpeg admin@${SERVER}:pics/${DATE}.jpeg || true
