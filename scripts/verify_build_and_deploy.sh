#!/bin/bash

# Install dependencies
yarn

# Generate static content
yarn build

# Check if the build was successful
if [ -d "build" ]; then
  echo "Build successful"
else
  echo "Build failed"
  exit 1
fi

# Start the local development server
yarn start &

# Wait for the server to start
sleep 5

# Check if the server started successfully
if ! curl -s http://localhost:3000 >/dev/null; then
  echo "Server failed to start"
  exit 1
fi

# Open the website in a browser window
xdg-open http://localhost:3000

# Wait for the user to manually verify the website

# Stop the local development server
kill %1

# Perform additional checks on the website content
# TODO: Add additional checks here

# Print success message
echo "Build and deployment verification successful"
