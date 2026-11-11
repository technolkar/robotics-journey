#!/bin/bash
# my first system check script 
echo "==== System check for $USER ===="
echo "Date: $(date)"
echo ""
echo "--- Ubuntu version ---"
lsb_release -d
echo ""
echo "--- GPU ---"
nvidia-smi --query-gpu=name,driver_version,memory.total --format=csv
echo ""
echo "--- Disk space in home ---"
df -h ~ | tail -1
echo ""
echo "--- Am I in dialout group? ---"
if groups | grep -q dialout; then
    echo "YES - ready for ESP32/Arduino/Lidar"
else 
echo "NO -run: sudo usermod -aG dialout \$USER"
fi 
echo ""
echo "Robot name: $ROBOT_NAME"

