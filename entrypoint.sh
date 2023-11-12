#!/bin/bash

# Update main.cf with the environment variable values
sed -i "s|RELAY_HOST|${RELAY_HOST}|" /etc/postfix/main.cf

# Create sasl_passwd file
echo "$RELAY_HOST    $USERNAME:$PASSWORD" > /etc/postfix/sasl_passwd
chmod 600 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd

# Start Postfix
service postfix start

# Start bash shell
exec /bin/bash
