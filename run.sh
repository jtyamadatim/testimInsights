#!/bin/bash
PROJECT_NAME=$1
PROJECT_ID=$2
API_KEY=$3
PARAMS=$4

# Handle missing parameters
if [ "$API_KEY" = "" ]; then
    echo 'API_KEY is empty! Pass "API_KEY" as 1st shell parameter'
    exit 1
fi

if [ "$PROJECT_NAME" = "" ]; then
    echo 'PROJECT_NAME is empty! Pass "PROJECT_NAME" as 2nd shell parameter'
    exit 1
fi

if [ "$PROJECT_ID" = "" ]; then
    echo 'PROJECT_ID is empty! Pass "PROJECT_ID" as 3rd shell parameter'
    exit 1
fi

if [ "$PARAMS" = "" ]; then
    echo 'PARAMS is empty! Pass "PARAMS" as 4th shell parameter'
    exit 1
fi

# removes any dangling images
docker images -qf dangling=true | xargs -r docker rmi || true
# Remove existing container if any
docker container rm analyzer -f || true &&
    # pull image
    docker pull testimio/testim-analyzer:latest &&
    # build a local image with additional files if any
    docker build -q -t testim_analyzer . &&
    # Run container
    docker run --memory-swap -1 --tty -e API_KEY="${API_KEY}" -e PROJECT_ID="${PROJECT_ID}" --name analyzer -t testim_analyzer -n "${PROJECT_NAME}" -a "${PARAMS}" &&
    #  Copy output folder from docker to current path
    docker cp analyzer:/app/src/python/output ${PWD} &&
    # Remove container
    docker container rm analyzer -f &&
    # clean up dangling images, processes (if any)
    docker images -qf dangling=true | xargs -r docker rmi || true &&
    docker ps -aqf status=exited | xargs -r docker rm || true && 
    docker system prune -f || true &&
    exit
