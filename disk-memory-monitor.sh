#!/bin/bash
## this script is to calculate the memory og the disk
disk=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
memory=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')
echo  "$(date) disk : $disk  Memory: $memory" >> ~/devops-learning/disk-memory.log
if [ $disk -gt 80 ]; then
	echo "$(date) disk usage exceeds 80" >> ~/devops-learning/disk-memory.log
	curl  -X POST "https://discord.com/api/webhooks/1520081953263456449/375ivC3PRLxyZPc9rNeatlk4_s-r-kSCOzmefHo4DUCgmvMUFuiwu8Ci--WJSYyN4Pvf" \
	-H "Content-Type: application/json" \
	-d "{\"content\": \"$(date) disk usage is $disk which exceeds limit 80 by $((disk-80)) \"}"
fi

if [ $memory -gt 80 ]; then
        echo "$(date) memory usage exceeds 80" >> ~/devops-learning/disk-memory.log
        curl  -X POST "https://discord.com/api/webhooks/1520081953263456449/375ivC3PRLxyZPc9rNeatlk4_s-r-kSCOzmefHo4DUCgmvMUFuiwu8Ci--WJSYyN4Pvf" \
        -H "Content-Type: application/json" \
        -d "{\"content\": \"$(date) memory  usage is $memory which exceeds limit 80 by $((memory-80)) \"}"
fi
