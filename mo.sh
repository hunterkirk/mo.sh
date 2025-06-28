#!/usr/bin/env bash

OLLAMA_URL="http://localhost:11434"

# Timestamp for log file
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
LOGFILE="multi-ollama-$TIMESTAMP.log"

# Check for prompt argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 \"Your prompt here\""
  exit 1
fi

PROMPT="$1"

# Clear/create the log file at start
> "$LOGFILE"

# Get models with name and size, sort by size ascending
# Output format: size_bytes TAB model_name
mapfile -t MODEL_LIST < <(
  curl -s "$OLLAMA_URL/api/tags" | jq -r '.models[] | "\(.size)\t\(.model)"' | sort -n
)

echo "Found ${#MODEL_LIST[@]} models sorted by size (smallest to largest):"
for entry in "${MODEL_LIST[@]}"; do
  size_bytes=$(echo "$entry" | cut -f1)
  model_name=$(echo "$entry" | cut -f2)
  size_mb=$(awk "BEGIN {printf \"%.2f\", $size_bytes/1024/1024}")
  echo " - $model_name (${size_mb} MB)"
done

# Loop through sorted models and query
for entry in "${MODEL_LIST[@]}"; do
  size_bytes=$(echo "$entry" | cut -f1)
  MODEL=$(echo "$entry" | cut -f2)

  echo "==============================="
  echo "Querying model: $MODEL"
  echo "==============================="

  RESPONSE=$(curl -s "$OLLAMA_URL/api/generate" \
    -d "{\"model\": \"${MODEL}\", \"prompt\": \"$PROMPT\", \"stream\": false}")

  TEXT=$(echo "$RESPONSE" | jq -r '.response')

  {
    echo "=============================================="
    echo "Model: $MODEL (Size: $(awk "BEGIN {printf \"%.2f\", $size_bytes/1024/1024}") MB)"
    echo "=============================================="
    echo "$TEXT"
    echo -e "\n"
  } >> "$LOGFILE"

  echo "Saved output for $MODEL to $LOGFILE"
done
