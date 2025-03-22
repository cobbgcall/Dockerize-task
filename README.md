# Build Taskfile.dev container image 

This repository contains an unofficial Dockerfile for [Task](https://taskfile.dev/), a simple and efficient task manager that is highly useful for automating CI/CD processes.

## Features

- Lightweight image based on `debian:bullseye-slim`.
- Includes essential tools like `git`, `curl`, and `vim`.
- Automatically installs Task CLI.
- Configured with a non-root user (`taskUser`) for better security.

