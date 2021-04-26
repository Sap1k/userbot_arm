#!/usr/bin/env bash

exit_script()
{
echo "Build was killed!"
sendTG "Docker image build was killed!"
}

trap exit_script SIGINT SIGTERM

docker build . -t sap1k/userbot_arm
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push sap1k/userbot_arm
