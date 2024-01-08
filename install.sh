#!/bin/bash

# Install necessary dependencies
sudo nala install -y build-essential make gcc libx11-dev libxft-dev libxinerama-dev || {
  echo "Error installing dependencies. Please check your internet connection and try again."
  exit 1
}

# Create the suckless folder if it doesn't exist
mkdir -p ~/suckless

# Change into the suckless folder
cd ~/suckless

# Clone the repositories, checking for errors
for repo in dwm dmenu st; do
  git clone https://git.suckless.org/$repo || {
    echo "Error cloning $repo. Please check your internet connection and try again."
    exit 1
  }
done

# Build and install each repository
for repo in dwm st dmenu; do
  cd $repo
  make
  sudo make clean install
  cd ..  # Return to the suckless directory
done

echo "Repositories cloned, built, and installed successfully!"
