#!/bin/bash
set -euo pipefail
trap 'echo "[ERROR] Update script failed at line $LINENO" | tee -a "$LOG_FILE"' ERR

LOG_FILE="$HOME/update_cleanup.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Starting system update..." >> "$LOG_FILE"
sudo apt update -y && sudo apt upgrade -y >> "$LOG_FILE" 2>&1
echo "[$TIMESTAMP] System updated successfully." >> "$LOG_FILE"

echo "[$TIMESTAMP] Performing cleanup..." >> "$LOG_FILE"
sudo apt autoremove -y && sudo apt clean >> "$LOG_FILE" 2>&1
echo "[$TIMESTAMP] Cleanup completed." >> "$LOG_FILE"
