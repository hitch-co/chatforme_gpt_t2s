#!/bin/bash

#usage: ./start_audio_and_container.sh

# Start the PulseAudio server
pulseaudio -D --exit-idle-time=-1

# Give the server some time to initialize. Adjust as needed.
sleep 5

# Run the Docker container (remember this opens bash)
docker run --name chatforme_gpt_t2s_container -e PULSE_SERVER=host.docker.internal -it chatforme_gpt_t2s_image