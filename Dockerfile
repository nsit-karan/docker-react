FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


#Second run phage which just needs to use app/build contents from previous phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
