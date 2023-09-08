@echo off
setlocal enabledelayedexpansion

::##################
::     UNTESTED
::##################

::Set the image name
set IMAGE_NAME=chatforme_gpt_t2s_image
set CONTAINER_NAME=chatforme_gpt_t2s_container
set DOCKERFILE_NAME=Dockerfile-alpine

::Check if Docker is installed
docker --version > NUL 2>&1
if errorlevel 1 (
    echo Docker is not installed or not available in the PATH. Please install Docker first.
    exit /b
)

::Start the Pulse Audio Server
echo Starting the pulse audio server. Note: starting daemon may faile
pulseaudio -D --exit-idle-time=-1

::Build the Docker image
echo Building Docker image...
docker build -f %DOCKERFILE_NAME% -t %IMAGE_NAME% .
1

::Run the Docker container
echo Running Docker container...
docker run --name %CONTAINER_NAME% -e PULSE_SERVER=host.docker.internal -it %IMAGE_NAME%

echo Starting python and running voice_t2s.py
python3 voice_t2s.py

::End of script
echo Done!

endlocal
