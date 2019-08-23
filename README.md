# first things first

This is a containerized version of the server for the game [Avorion](https://www.avorion.net/).

## about

The container starts the avorion server service via the Steam client for Linux. It maps all the ports to the host system, so they become immediately available.

When a container is restarted, it will automatically pull the latest version of the avorion server.

## usage

`docker-compose up -d` should be sufficiant for a basic image. Your galaxy is expected to be in `/var/avorion/avorion_galaxy`. If you have it placed somewhere else, please adjust the docker-compose.yml accordingly.
