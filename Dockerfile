FROM node:12-alpine

COPY . app/

WORKDIR app/

RUN npm i

RUN npm run build

EXPOSE 3000

ENTRYPOINT npm run start

