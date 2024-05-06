#!/bin/bash


while [[ $(< /letsencrypt/state.txt) == "temp" ]]; 
do 
    sleep 1 && echo "..."; 
done 

/usr/sbin/nginx -s stop 

echo "Certbot certificate recieved" 
