FROM node:8

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

ARG VERSION=v0
ENV VERSION $VERSION

ARG HCFAIL=false
ENV HCFAIL $HCFAIL

ARG NODEFAIL=false
ENV NODEFAIL $NODEFAIL

ARG DELAY=5000
ENV DELAY $DELAY

ARG PORT=80
ENV PORT $PORT

WORKDIR /opt

COPY package.json package-lock.json* ./

RUN npm install && npm cache clean --force

ENV PATH /opt/node_modules/.bin:$PATH

WORKDIR /opt/app

COPY . /opt/app

# NO HEALTHCHECK

CMD [ "node", "index.js" ]
