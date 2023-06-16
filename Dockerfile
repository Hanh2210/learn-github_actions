# Use the official Node.js 14 image as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Expose a port if necessary (replace PORT_NUMBER with the actual port number)
EXPOSE PORT_NUMBER

# Set the command to run your application (replace "start" with the actual command)
CMD ["npm", "start"]
