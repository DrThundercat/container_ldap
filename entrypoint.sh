#!/bin/bash
set -e

# Start the directory server in the background so we can run the setup script
/usr/libexec/dirsrv/dscontainer -r &
DS_PID=$!

# Wait for the server to become ready. Keep the original 3-minute wait as a fallback.
sleep 180

# Run the container's setup script (use absolute path inside container)
/opt/setup.sh

# Wait for the directory server process so the container stays alive
wait "$DS_PID"