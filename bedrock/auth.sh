#!/bin/bash

# Define the text to look for in the logs
TEXT_TO_LOOK_FOR="text_you_are_looking_for"

# Define the action to take when the text is found
ACTION="echo 'Text found!' && /path/to/action/script if needed"

# Use docker-compose logs with the --follow flag to get a continuous stream
docker-compose logs --follow | while read -r line; do
    # Use grep to look for the text in the log line
    if echo "$line" | grep -q "$TEXT_TO_LOOK_FOR"; then
        # Text found, perform the action
        eval "$ACTION"
    fi
done