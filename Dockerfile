FROM node:18-alpine as builder
WORKDIR /app
COPY package.deps.json package.json
COPY yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app .
CMD ["node", ".output/server/index.mjs"]
