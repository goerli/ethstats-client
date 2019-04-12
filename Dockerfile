FROM node:11-alpine

RUN apk update && apk add git ca-certificates
RUN adduser -S ethnetintel

WORKDIR /home/ethnetintel/ethstats-client

ADD package.json .
RUN npm install && npm install -g pm2

ADD . .

RUN chown -R ethnetintel. .

ENV NODE_ENVIRONMENT=production
USER ethnetintel

ENTRYPOINT ["pm2-runtime", "app.json"]