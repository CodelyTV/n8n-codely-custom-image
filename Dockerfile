FROM n8nio/n8n:{N8N_VERSION}

USER root

# Installs latest Chromium (100) package.
RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ttf-freefont \
      yarn \
      curl

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

USER node

RUN mkdir ~/.n8n/custom

# Add custom n8n nodes from Codely
RUN cd ~/.n8n/custom && \
    npm install --production --force @codelytv/n8n-nodes-twitch n8n-nodes-puppeteer cryptr 

  