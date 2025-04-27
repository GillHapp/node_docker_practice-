# ===================
# Build Stage
# ===================
FROM node:20-alpine3.18 AS builder

# Set working directory
WORKDIR /app

# Copy only package.json and package-lock.json (if exists) first
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# ===================
# Production Stage
# ===================
FROM node:20-alpine3.18

# Set working directory
WORKDIR /app

# Copy only needed files from builder stage
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/index.js ./index.js
COPY --from=builder /app/package.json ./package.json


# Expose the port your app runs on
EXPOSE 3000

# Define the command to run your app
CMD ["npm", "start"]
