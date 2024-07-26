#!/bin/bash

# Variables
URL="$1" # The URL to check, provided as the first argument
LOG_FILE="health_check.log" # Log file to store the health check results

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> $LOG_FILE
}

# Function to check if the URL is provided
check_url() {
    if [ -z "$URL" ]; then
        echo "Usage: $0 <url>"
        exit 1
    fi
}

# Function to check the health of the application
check_health() {
    local status_code
    status_code=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

    if [ "$status_code" -eq 200 ]; then
        log_message "Application is UP. Status code: $status_code"
        echo "Application is UP. Status code: $status_code"
    else
        log_message "Application is DOWN. Status code: $status_code"
        echo "Application is DOWN. Status code: $status_code"
    fi
}

# Check if the URL is provided
check_url

# Check the health of the application
check_health
