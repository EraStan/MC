#!/bin/bash

start_time=$(date +%s)
timeout=200

echo "Starting port check for port 25565 on localhost."
echo "Timeout is set to $timeout seconds."

while true; do
    nc -z localhost 25565
    if [ $? -eq 0 ]; then
        echo "Port 25565 is open."
        exit 0
    else
        current_time=$(date +%s)
        elapsed_time=$((current_time - start_time))
        echo "Port 25565 is not open yet. Elapsed time: $elapsed_time seconds."
        if [ $elapsed_time -ge $timeout ]; then
            echo "Port 25565 did not open within $timeout seconds. Exiting with error."
            exit 1
        fi
        sleep 1
    fi
done
