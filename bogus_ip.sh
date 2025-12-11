#!/bin/bash

cat "/etc/hosts" | while read ip host _; do
    if [[ "$ip" == "#"* || "$ip" == :* ]]; then 
        continue 
    fi

    real_ip=$(nslookup "$host" 2>/dev/null | grep -e "Address: .*\..*\..*\..*" | tail -n 1 | awk '{print $2}')
    if [[ "$ip" == "#"* || "$ip" == :* ]]; then 
        continue 
    fi
    echo "For $host este $real_ip"
    if [ ! "$ip" == "$real_ip" ]; then
        echo "Bogus IP for $host in /etc/hosts!"
    fi
done
