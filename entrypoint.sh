#!/bin/sh

# Write config.py config file from Docker env variables
cat <<EOF > /opt/config.py
root_path = "$ROOT_PATH"
username = "$USERNAME"
client_id = "$CLIENT_ID"
client_secret = "$CLIENT_SECRET"
EOF

# Hand off to the CMD
exec "$@"
