FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Build the Next.js app
RUN npm run build

# Generate prisma
RUN npx prisma generate

# Set the command to run when the container starts
CMD ["/bin/sh", "-c", "npm run dev"]
