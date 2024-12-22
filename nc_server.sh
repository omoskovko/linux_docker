#!/bin/sh
PIPE=/tmp/nc_pipe

# Create a named pipe
[ -p $PIPE ] || mkfifo $PIPE

# Start an infinite loop
while true; do
    # Start listening in the background
    tail -f $PIPE | nc -l -k -p 1234 | while read line; do
        if [ $line == "hello" ]; then
            echo "Hi there!" > $PIPE
        else
            echo "You said: $line" > $PIPE
        fi
        echo "${line}: Waiting for the next message..."
    done
done
