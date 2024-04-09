#!/bin/bash

/opt/ps5cam/ps5_camera_firmware_loader /opt/ps5cam/firmware.bin || echo "PS5 Cam Firmware loaded"
v4l2-ctl --device /dev/video0 --set-ctrl=auto_exposure=0 && echo "Exposure set to auto (0) in /dev/video0"
v4l2-ctl --device /dev/video0 --set-ctrl=auto_exposure=2 && echo "Exposure set to shutter priority (2) in /dev/video0"
exit 0
