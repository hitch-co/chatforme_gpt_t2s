#!/bin/bash

# Start the PulseAudio server
./pulseaudio-1.1/bin/pulseaudio.exe --use-pid-file=false -D

# Give the server some time to initialize. Adjust as needed.
sleep 5

# Run the Docker container
docker run --name chatforme_gpt_t2s_container -e PULSE_SERVER=host.docker.internal -it chatforme_gpt_t2s_image