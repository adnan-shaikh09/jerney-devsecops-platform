# ------------- Build stage -------------------
FROM node:20-alpine3.22 AS build
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --only=production && npm cache clean --force

# ------------- Production Stage --------------
FROM node:20-alpine3.32 AS production

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

RUN apk add --no-cache dumb-init

WORKDIR /app

COPY --from=build /app/node_modules ./node_modules
COPY src/ ./src/

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 5000

ENTRYPOINT ["dumb-init", "--"]
CMD ["node", "src/index.js"]
