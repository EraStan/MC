#!/bin/bash

start_time=$(date +%s)
timeout=100

while true; do
    nc -z localhost 25565
    if [ $? -eq 0 ]; then
        exit 0
    else
        current_time=$(date +%s)
        elapsed_time=$((current_time - start_time))
        if [ $elapsed_time -ge $timeout ]; then
            exit 1
        fi
        sleep 1
    fi
done
