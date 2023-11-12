# Use the specified Ubuntu version as a build argument
ARG BASE_IMAGE_TAG=latest

# Use the base srnjak-dev-playground image with the specified tag
FROM srnjak/srnjak-dev-playground:${BASE_IMAGE_TAG}
MAINTAINER Grega Krajnc, srnjak.com

# Set environment variables
ENV RELAY_HOST="[mail.example.com]:465"
ENV USERNAME="<your_username>"
ENV PASSWORD="<your_password>"

# Install necessary packages
RUN apt-get update \
    && apt-get install -y postfix \
    && apt-get install -y mailutils \
    && rm -rf /var/lib/apt/lists/*

# Configure Postfix
COPY postfix/main.cf /etc/postfix/main.cf

# Create an entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Start Postfix using the entrypoint script
ENTRYPOINT /entrypoint.sh