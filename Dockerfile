FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn run build

FROM nginx
EXPOSE 8080
COPY --from=builder /app/build /usr/share/nginx/html


