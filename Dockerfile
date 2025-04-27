# Step 1: Use Node official image
FROM node:20-alpine3.18

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Step 4: Copy all project files
COPY . .

# Step 5: Define the command to run
CMD ["npm", "start"]
