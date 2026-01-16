#!/bin/bash

# ========= CONFIG =========
JSON_FILE="likes_media_likes.json"
DELAY_MIN=8        # seconds
DELAY_MAX=15       # seconds
BATCH_SIZE=20      # stop after N posts
OPEN_CMD="open"    # macOS: open | Linux: xdg-open
# ==========================

if [[ ! -f "$JSON_FILE" ]]; then
  echo "❌ JSON file not found: $JSON_FILE"
  exit 1
fi

echo "📦 Extracting liked post URLs..."

URLS=$(jq -r '
  .likes_media_likes[]
  | .string_list_data[]
  | .href
' "$JSON_FILE")

COUNT=0

for URL in $URLS; do
  COUNT=$((COUNT+1))

  echo "🔗 [$COUNT] Opening: $URL"
  $OPEN_CMD "$URL"

  if [[ $COUNT -ge $BATCH_SIZE ]]; then
    echo "🛑 Batch limit reached ($BATCH_SIZE). Stop & resume later."
    break
  fi

  DELAY=$((RANDOM % (DELAY_MAX - DELAY_MIN + 1) + DELAY_MIN))
  echo "⏳ Sleeping for $DELAY seconds..."
  sleep $DELAY
done

echo "✅ Done. Resume later to stay safe."