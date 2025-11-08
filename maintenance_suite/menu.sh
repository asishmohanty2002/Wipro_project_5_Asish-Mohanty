#!/bin/bash
# ===========================================
# Enhanced System Maintenance Suite (v3.0)
# ===========================================
# Author: Asish
# Course: Linux OS & LSP (Assignment 5)
# Description: Automates system backup, update, and log monitoring with error handling.

set -euo pipefail

# ----- VARIABLES -----
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$HOME/maintenance_logs"
mkdir -p "$LOG_DIR"
SUITE_LOG="$LOG_DIR/suite_$(date +%Y-%m-%d).log"

# ----- FUNCTION: Logger -----
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$SUITE_LOG"
}

# ----- FUNCTION: Ensure Sudo -----
sudo -v  # Ask for sudo password once at start

# ----- MENU LOOP -----
while true; do
    clear
    echo "======================================"
    echo "        SYSTEM MAINTENANCE SUITE      "
    echo "======================================"
    echo "1. Run Backup"
    echo "2. Update and Clean System"
    echo "3. Monitor Logs"
    echo "4. View Suite Log"
    echo "5. Exit"
    echo "--------------------------------------"
    read -rp "Enter your choice [1-5]: " choice

    case $choice in
        1)
            log "Running backup script..."
            if sudo "$DIR/backup.sh"; then
                log "Backup completed successfully."
            else
                log "[ERROR] Backup failed!"
            fi
            read -rp "Press Enter to continue..."
            ;;
        
        2)
            log "Starting system update & cleanup..."
            if sudo "$DIR/update.sh"; then
                log "System update & cleanup completed."
            else
                log "[ERROR] Update & cleanup failed!"
            fi
            read -rp "Press Enter to continue..."
            ;;
        
        3)
            log "Running log monitor..."
            if sudo "$DIR/logmonitor.sh"; then
                log "Log monitor completed."
            else
                log "[ERROR] Log monitor failed!"
            fi
            read -rp "Press Enter to continue..."
            ;;
        
        4)
            echo "------ SUITE LOG (last 200 lines) ------"
            tail -n 200 "$SUITE_LOG" || echo "No logs available yet."
            echo "----------------------------------------"
            read -rp "Press Enter to continue..."
            ;;
        
        5)
            log "Exiting Maintenance Suite."
            echo "Goodbye!"
            exit 0
            ;;
        
        *)
            echo "Invalid choice! Please select between 1–5."
            sleep 1
            ;;
    esac
done
