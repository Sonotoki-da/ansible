#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Error: No *.yml file is provided"
  exit 1
fi

# Build the Docker image
docker build -t sohro .

# Run the container and test the Ansible playbook
docker run -it sohro:latest bash -c "ansible-playbook $1 -vvvv && exec zsh"
