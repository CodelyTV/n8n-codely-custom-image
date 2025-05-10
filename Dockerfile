ARG N8N_VERSION
FROM n8nio/n8n:${N8N_VERSION}

RUN if [ -z "$N8N_VERSION" ]; then echo "💥 N8N_VERSION argument missing."; exit 1; fi && \
    mkdir -p /home/node/.n8n/nodes && \
    npm install --prefix /home/node/.n8n/nodes --production --silent @codelytv/n8n-nodes-twitch
