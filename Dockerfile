# Specify the base image
FROM node:20

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

# App binds to port 3000 so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3000

# Define the command to run the app using CMD which defines your runtime
CMD [ "node", "index.js" ]