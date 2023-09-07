@echo off
setlocal enabledelayedexpansion

::Set the image name
set IMAGE_NAME=chatforme_gpt_t2s_image

::Check if Docker is installed
docker --version > NUL 2>&1
if errorlevel 1 (
    echo Docker is not installed or not available in the PATH. Please install Docker first.
    exit /b
)

::Build the Docker image
echo Building Docker image...
docker build -t %IMAGE_NAME% .
1
::Run the Docker container
echo Running Docker container...
docker run -it %IMAGE_NAME%

::End of script
echo Done!

endlocal
