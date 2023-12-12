FROM node:18-alpine
WORKDIR /image1
COPY . .

RUN npm install
CMD ["node", "server.js"]

EXPOSE 8080
