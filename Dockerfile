# Use an outdated version of Ubuntu as the base image
FROM ubuntu:16.04

# Install vulnerable packages
RUN apt-get update && \
    apt-get install -y wget curl && \
    apt-get install -y openssh-server && \
    apt-get install -y apache2 && \
    apt-get clean

# Expose ports for SSH and HTTP
EXPOSE 22 80

# Start services
CMD service ssh start && service apache2 start && tail -f /dev/null
