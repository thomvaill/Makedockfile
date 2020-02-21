FROM node:12.16.1-alpine3.11

WORKDIR /usr/src/app

# Install app dependencies
# We perform this stage before copying app source for Docker build cache optimization
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
RUN npm install --only=production

# Copy app source
COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]
