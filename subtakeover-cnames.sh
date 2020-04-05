#!/usr/bin/bash

domain=$1

while read subdomain; do
    cname=$(host -t CNAME $subdomain.$domain | grep 'an alias' | awk '{print $NF}')

    if [ -z "$cname" ]; then
        continue
    fi

    if ! host $cname &> /dev/null; then
        echo "$cname did not resolve ($subdomain.$domain)";
    fi
done
