#!/bin/bash

# use it like ./typhoon.sh [typhoon_name] [hko_image_id]
# example: ./typhoon.sh ragasa nwp_2528

while true; do
    current_time=$(date +"%Y-%m-%dT%H:%M:%S")
    photo_name="$1_$current_time.png"
    wget -q "https://www.hko.gov.hk/wxinfo/currwx/$2.png" -O "$photo_name"
    echo "Downloaded photo at $current_time"
    sleep 3600
done
