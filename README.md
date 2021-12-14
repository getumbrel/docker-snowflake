## To run this docker container:
``` 
docker-compose up -d
```

## Releasing a new image
First, build the image:
```
make build VERSION=X.Y
```
Next, release a new version by adding a tag:
```
make tag VERSION=X.Y
```
Finally, release the image:
```
make release VERSION=X.Y
```
Once we released a new image version, we tag the respective git commit:
```
git tag -a -s "vVERSION" -m "Docker image version VERSION"
git push --tags origin main
```

## Adding custom options:
To use custom options when running this image you can add them to `command:` line in the docker-compose.yml like this:

    command: [ "-broker" , "https://snowflake-broker.torproject.net/"  ]

so the full docker-compose.yml looks something like this:

    version: "3.8"

    services:
        snowflake-proxy:
            network_mode: host
            image: thetorproject/snowflake-proxy:latest
            container_name: snowflake-proxy
            restart: unless-stopped
            command: [ "-broker" , "https://snowflake-broker.torproject.net/" ]

### Available options:

    -broker string
            broker URL (default "https://snowflake-broker.bamsoftware.com/")
    -capacity uint
            maximum concurrent clients
    -keep-local-addresses
            keep local LAN address ICE candidates
    -log string
            log filename
    -relay string
            websocket relay URL (default "wss://snowflake.bamsoftware.com/")
    -stun string
            stun URL (default "stun:stun.stunprotocol.org:3478")
    -unsafe-logging
            prevent logs from being scrubbed
