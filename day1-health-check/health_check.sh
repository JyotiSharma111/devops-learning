#!/bin/bash

THRESHOLD_DISK=80
THRESHOLD_MEM=80
LOG_FILE="/home/ubuntu/health_check.log"

DATE=$(date)
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')

echo "$DATE - Disk: ${DISK_USAGE}% | Memory: ${MEM_USAGE}%" >> $LOG_FILE

if [ "$DISK_USAGE" -gt "$THRESHOLD_DISK" ]; then
    echo "$DATE - WARNING: Disk usage above ${THRESHOLD_DISK}%" >> $LOG_FILE
fi

if [ "$MEM_USAGE" -gt "$THRESHOLD_MEM" ]; then
    echo "$DATE - WARNING: Memory usage above ${THRESHOLD_MEM}%" >> $LOG_FILE
fi
