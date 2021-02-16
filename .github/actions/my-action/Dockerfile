# Base image
FROM ubuntu:focal

# Actualize
RUN apt-get update -y && apt-get upgrade -y
# Install packages for pipeline
RUN apt-get install --no-install-recommends -y \
    git \
    python3 \
    python3-pip
# Install packages for debug
RUN apt-get install --no-install-recommends -y \
    vim
	
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Permission change of the bash file
RUN chmod +x entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]