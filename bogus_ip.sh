#!/bin/bash

bogus() {
    name="$1"
    addr="$2"
    server="$3"
    real_ip=$(nslookup "$name" "$server"  2>/dev/null | grep -e "Address: .*\..*\..*\..*" | tail -n 1 | awk '{print $2}')
    if [ ! "$addr" == "$real_ip" ]; then
        echo "Bogus IP for $name!"
    else
	echo "IP-ul este corect"
    fi
}

bogus $1 $2 $3

#MUHAHAHHA TOMA SUNT
