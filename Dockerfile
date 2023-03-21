FROM node:lts-alpine3.16

# Create app directory
WORKDIR /app

# Install dependencies 
COPY package*.json ./

RUN npm install

COPY . .
EXPOSE 3000
CMD ["npm", "start"]