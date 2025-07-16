#!/bin/bash

# Create warp directory if missing
mkdir -p /var/lib/cloudflare-warp

# Create tun device
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

# Update mxm.xml with environment variables
sed -i "s/ORGANIZATION/$ORGANIZATION/g" /var/lib/cloudflare-warp/mdm.xml
sed -i "s/AUTH_CLIENT_ID/$AUTH_CLIENT_ID/g" /var/lib/cloudflare-warp/mdm.xml
sed -i "s/AUTH_CLIENT_SECRET/$AUTH_CLIENT_SECRET/g" /var/lib/cloudflare-warp/mdm.xml

# Start and wait for service
warp-svc &
sleep 2

# Connect to vnet if present
if [ -n "$VNET_ID" ]; then
    warp-cli vnet $VNET_ID
fi

# Monitor service logs
tail -vf /var/lib/cloudflare-warp/cfwarp_service_log.txt