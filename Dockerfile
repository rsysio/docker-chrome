FROM python:3.6-slim

ENV DEBIAN_FRONTEND noninteractive

# Install deps + add Chrome Stable + purge all the things
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    unzip \
    gnupg \
    --no-install-recommends \
    # install chrome
    && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y google-chrome-stable --no-install-recommends \
    # /install chrome
    # Install Chrome WebDriver
    && CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` \
    && mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION \
    && curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip \
    && unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION \
    && rm /tmp/chromedriver_linux64.zip \
    && chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver \
    && ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver \
    # /Install Chrome WebDriver
    && apt-get purge --auto-remove -y \
    && rm -rf /var/lib/apt/lists/*

# Add Chrome as a user
RUN groupadd -r chrome --gid=1000 \
    && useradd -r -g chrome --uid=1000 -G audio,video chrome \
    && mkdir -p /usr/src/app \
    && chown -R chrome:chrome /usr/src/app

# Run Chrome non-privileged
USER chrome
WORKDIR /usr/src/app

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

