#!/usr/bin/bash

mkdir -p html

while read url; do
    filename=$(echo $url | sha1sum | awk '{print $1}')
    filename="html/$filename"
    echo "$filename - $url" | tee -a index
    curl -sk -v "$url" > $filename
done
