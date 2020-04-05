#!/usr/bin/bash

domain=$1

# read means read line one by one from stdin.. so if you do ./brute yahoo.com < subdomains.txt, it will read one line at the moment from subdomains.txt
while read subdomain; do
    # redirect errors and output to /dev/null - if host lookup is successful, echo it to stdout
    if host $subdomain.$domain &> /dev/null; then
        echo "$subdomain.$domain";
    fi
done
