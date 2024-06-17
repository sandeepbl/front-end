# Use an official Node.js runtime as a parent image
FROM node:14 as build-stage

# Set the working directory
WORKDIR /app

# Copy the package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the app
RUN npm run build

# Use an official Nginx runtime as a parent image
FROM nginx:stable-alpine as production-stage

# Copy the build output to Nginx's root directory
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]