#Dockerfile
#usage: docker build -t chatforme_gpt_t2s_image .
#usage: docker run --name chatforme_gpt_t2s_container -it chatforme_gpt_t2s_image
#usage: docker run --name chatforme_gpt_t2s_container -it -e PULSE_SERVER=host.docker.internal:4713 chatforme_gpt_t2s_image

# Start from the Python 3.11 slim image
FROM python:3.11

# Set the working directory inside the container
WORKDIR /app

# Add metadata using LABEL instruction (good practice)
LABEL maintainer="eric.hitchman@example.com" \
      version="1.2" \
      description="Python 3.11 application with ffmpeg"

# Update system packages and install ffmpeg
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*
    #pulseaudio \
    #pulseaudio-utils \
    #&& load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 \
    #&& pulseaudio -D

RUN apt-get install -y pulseaudio \
    && apt-get install -y pulseaudio

# Copy requirements.txt and install the Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application (assuming all files are needed)
COPY . .

# Set the default command to bash
CMD ["bash"]