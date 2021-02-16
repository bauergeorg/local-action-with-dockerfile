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

#COPY main.sh /main.sh

# Open Bash
CMD ["/bin/bash"]