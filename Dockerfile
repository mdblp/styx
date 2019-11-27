FROM node:10.15.3-alpine

ARG npm_token
ENV nexus_token=$npm_token
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk add --no-cache make gcc g++ python

WORKDIR /app

COPY package*.json ./
COPY .npmrc .

RUN npm install

USER node

COPY . .

CMD ["node", "server.js"]
