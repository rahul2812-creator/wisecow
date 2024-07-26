#!/bin/bash

# Variables
SOURCE_DIR="$1" # Directory to backup, provided as the first argument
REMOTE_USER=" " # Remote server username
REMOTE_HOST=" " # Remote server address
REMOTE_DIR=" " # Remote directory to store the backup
LOG_FILE="simple_backup.log" # Log file to store the backup status

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> $LOG_FILE
}

# Check if the source directory is provided
if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: $0 <source_directory>"
    exit 1
fi

# Perform the backup using rsync
rsync -avz "$SOURCE_DIR" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"
if [ $? -eq 0 ]; then
    log_message "Backup of $SOURCE_DIR to ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR} succeeded."
else
    log_message "Backup of $SOURCE_DIR to ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR} failed."
fi

# Print the log file path for user reference
echo "Backup operation completed. Check the log file at $LOG_FILE for details."
