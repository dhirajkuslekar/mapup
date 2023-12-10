FROM node:18-alpine
WORKDIR /docker_web_app
COPY . .

RUN npm install
CMD ["node", "server.js"]

EXPOSE 8080