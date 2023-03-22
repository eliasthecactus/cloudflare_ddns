#!/bin/bash

#===============CHANGES START===============#
# Set your Cloudflare email and API key
CF_API_KEY="your_api_key_here"

# Set your domain name and the A record you want to update
DOMAIN_NAME="example.com"
RECORD_NAME="www"

# record proxied (true) or not (false)
PROXY_STATUS="false"
#===============CHANGES END===============#

# Get the current public IP address
IP=$(curl -s http://checkip.amazonaws.com)

# Get the Zone ID for your domain
ZONE_ID=$(curl -X GET "https://api.cloudflare.com/client/v4/zones?name=$DOMAIN_NAME" \
    -H "Authorization: Bearer $CF_API_KEY" \
    -H "Content-Type: application/json" | jq -r '{"result"}[] | .[0].id')

# Get the Record ID for your A record
RECORD_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?type=A&name=$RECORD_NAME" \
  -H "Authorization: Bearer $CF_API_KEY" \
  -H "Content-Type: application/json" | jq -r '{"result"}[] | .[0].id')

# Update the A record with the new IP address
curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
  -H "X-Auth-Email: $CF_EMAIL" \
  -H "X-Auth-Key: $CF_API_KEY" \
  -H "Content-Type: application/json" \
  --data "{\"type\":\"A\",\"name\":\"$RECORD_NAME\",\"content\":\"$IP\",\"proxied\":$PROXY_STATUS}"
