FROM node:18 as base

WORKDIR /project

COPY package.json yarn.lock ./

FROM base as dev

RUN yarn

COPY . .

FROM base as prod

RUN yarn install --production=true

COPY . .