# docker-twitch-recorder
A Docker container to automatically record Twitch streams.

## Description
This repository hosts the source code for a Docker container that can automatically record livestreams from Twitch as they go live.
The main component ist from [Ancalentari Twitch Stream Recorder](https://github.com/ancalentari/twitch-stream-recorder).

## Requirements
To run this container and record streams from Twitch,
you need to register a dummy app and get a client_id and client_secret. Both is explained in the setup section.

## Setup
Create a `config.py` file in a directory of your choice (you will need to mount this file into the container later:

```properties
root_path = "/opt/recordings"
username = "gronkh"
client_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
client_secret = "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
```

`root_path` - path in the container to where your VODs will be saved to (Don't change this!)  
`username` - name of the streamer you want to record by default (Change this accordingly!)  
`client_id` - you can grab this from [here](https://dev.twitch.tv/console/apps) once you register your application (Replace with your own!)  
`client_secret` - you generate this [here](https://dev.twitch.tv/console/apps) as well, for your registered application (Replace with your own!)

## Usage
Start the container with the following `docker run` command:  
`docker run --rm -v /opt/docker-twitch-recorder/config.py:/opt/config.py -v /opt/docker-twitch-recorder/recordings:/opt/recordings/ ghcr.io/stefomat/twitch-stream-recorder:master`  
The options in this command:  
`--rm` Deletes the container, once it stops. (TODO: Can be removed from documentation at some point, won't be necessary anymore.)  
`-v /opt/docker-twitch-recorder/config.py:/opt/config.py` Map the created config file to a defined location in the container, so the python script can find it.  
`-v /opt/docker-twitch-recorder/recordings:/opt/recordings/` Map a folder of your choice to a defined location in the container. This is the placed where all recordings will be saved to.  
`ghcr.io/stefomat/twitch-stream-recorder:master` Use the "master" tag for the latest version, that's the GitHub branch from which the Docker images will be built from.

## Notes
None at the moment - have fun.
