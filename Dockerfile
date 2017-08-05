FROM ubuntu
# ------------------------------------------------------------------------------
# Install base & build tools
RUN apt-get update -y && apt-get -y dist-upgrade
RUN apt-get install -y apt-utils vim build-essential g++ curl wget libssl-dev \
    apache2-utils git libxml2-dev sshfs tmux nodejs npm zip

# ------------------------------------------------------------------------------
# Install forever
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g forever
    
# ------------------------------------------------------------------------------
# Install Cloud9

# Clone code
RUN git clone https://github.com/c9/core.git /cloud9
WORKDIR /cloud9

# Install
RUN scripts/install-sdk.sh

# Add config file
ADD settings settings
ADD configs configs

# ------------------------------------------------------------------------------
# Add volumes
RUN mkdir /workspace
VOLUME /workspace

RUN cp /usr/share/zoneinfo/PRC /etc/localtime && echo "Asia/shanghai" > /etc/timezone
# ------------------------------------------------------------------------------
# Clean up cache.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get purge -y --auto-remove \
    && apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y \
    && npm cache clean --force

# Environment
ENV NODE_ENV "production"
ENV LISTEN 0.0.0.0
#RUN ln -s /etc/apt/sources.list sources.list

# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 80

ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "--listen", "$LISTEN","--port","80"]
