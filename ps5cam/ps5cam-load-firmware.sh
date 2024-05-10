#!/bin/bash

/opt/ps5cam/ps5_camera_firmware_loader /opt/ps5cam/firmware.bin || echo "PS5 Cam Firmware loaded"

#brute force reset every time the device is opened
while inotifywait -e open /dev/video0; do
  echo "/dev/video0 opened, reset exposure"
  v4l2-ctl --device /dev/video0 --get-ctrl auto_exposure
  sleep 2
  v4l2-ctl --device /dev/video0 --set-ctrl=auto_exposure=0 && echo "Exposure set to auto (0) in /dev/video0, result: `v4l2-ctl --device /dev/video0 --get-ctrl auto_exposure`"
  sleep 1; 
  v4l2-ctl --device /dev/video0 --set-ctrl=auto_exposure=2 && echo "Exposure set to shutter priority (2) in /dev/video0, result: `v4l2-ctl --device /dev/video0 --get-ctrl auto_exposure`"
  v4l2-ctl --device /dev/video0 --set-ctrl=brightness=4;
  sleep 1;
done;


exit 0
