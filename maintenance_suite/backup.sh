#!/bin/bash
# backup.sh - Automated system backup

BACKUP_SRC="/home"
BACKUP_DEST="/backup/daily"
LOG_FILE="/backup/error.log"

# Ensure destination exists
sudo mkdir -p "$BACKUP_DEST"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DEST/backup_$DATE.tar.gz"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Running backup script..."

tar -czf "$BACKUP_FILE" "$BACKUP_SRC" 2>>"$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [SUCCESS] Backup created successfully at: $BACKUP_FILE"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [ERROR] tar command failed!" >> "$LOG_FILE"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [ERROR] tar command failed!"
fi

