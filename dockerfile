# Use the latest Ubuntu LTS base image
FROM ubuntu:24.04

# Install MinGW for cross-compilation to Windows
RUN apt-get update && apt-get install -y \
    mingw-w64 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /work

# Default command to run if no command is specified
CMD ["bash"]
