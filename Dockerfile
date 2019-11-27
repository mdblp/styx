FROM node:10.15.3-alpine

RUN apk --no-cache update && \
    apk --no-cache upgrade

WORKDIR /app

COPY package.json .

RUN yarn install && \
    yarn cache clean

USER node

COPY . .

CMD ["node", "server.js"]
