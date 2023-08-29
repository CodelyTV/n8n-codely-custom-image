ARG N8N_VERSION

RUN if [ -z "$N8N_VERSION" ] ; then echo "The N8N_VERSION argument is missing!" ; exit 1; fi

FROM n8nio/n8n:1.4.1

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

  