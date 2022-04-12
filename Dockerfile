### Build ###
FROM node:12.22-alpine3.10 AS build
WORKDIR /usr/src/app
COPY package.json package-locak.json ./
RUN npm i -g @angular/cli

### Install app dependencies
RUN npm Install
COPY . .
RUN ng build --prod

FROM nginx:1.17.1-alpine3
COPY nginx.conf /etc/nginx/nginx.config
COPY --from=build /usr/src/app/dist/* /usr/share/nginx/html