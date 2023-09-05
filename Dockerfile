# First stage for building the app
FROM node:16 AS build

# Set the working directory inside the container
WORKDIR /usr/src/app

# Create a directory for the app
RUN mkdir -p /usr/src/app

# Copy package.json and package-lock.json from root/project folder
COPY ./package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application files from folder1
COPY ./ ./

# Second stage for the final image
FROM gcr.io/distroless/nodejs16

COPY --from=build /usr/src/app /usr/src/app

WORKDIR /usr/src/app

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["node","app.js"]