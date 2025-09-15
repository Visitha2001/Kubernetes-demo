# Base image with Node.js
FROM node:18-alpine AS base
WORKDIR /app

# Copy package files
COPY package.json package-lock.json* ./
RUN npm ci --omit=dev

# Copy source code
COPY . .

# run as non-root
USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", "start"]