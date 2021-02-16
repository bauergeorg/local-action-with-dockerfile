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

## Install the gitlab-runner
# Install packeges for installation of gitlab-runner
RUN apt-get install --no-install-recommends -y \
    curl \
    gnupg2 \
    wget
RUN set -xe \
    && wget -O - "https://packages.gitlab.com/runner/gitlab-runner/gpgkey" | apt-key add - \
    && os=ubuntu \
    && dist=focal \
    && apt_config_url="https://packages.gitlab.com/install/repositories/runner/gitlab-runner/config_file.list?os=${os}&dist=${dist}&source=script" \
    && curl -sSf "${apt_config_url}" > "/etc/apt/sources.list.d/runner_gitlab-runner.list" 
RUN apt-get update
RUN apt-get install --no-install-recommends -y gitlab-runner

# Connection to Rohmann's Gitlab (saved in image)
RUN gitlab-runner register \
  --non-interactive \
  --url "http://gitlab.rohmann.de/" \
  --registration-token "j61GxuSdCRCZ9pWt4FCm" \
  --executor "shell" \
  --description "rohmanns-ubuntu-runner" \
  --tag-list "docker" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"

# Command on every startup of the container
CMD ["gitlab-runner","run"]