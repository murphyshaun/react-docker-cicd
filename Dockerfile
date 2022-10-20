FROM node:19-bullseye-slim AS build

WORKDIR /app

COPY . /app/

RUN npm install && npm run build

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html