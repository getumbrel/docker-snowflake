#### To run this docker container:
``` 
docker-compose up -d
```

#### Releasing a new image
First, build the image:
```
make build
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

#### Adding Custom URLs:
To add custom URLs before building the image change the URLs in ENTRYPOINT to your desired URLs. Default URLs are shown below.

``` dockerfile
ENTRYPOINT [ "proxy" , "--broker" , "https://snowflake-broker.torproject.net/" , "--relay" , "wss://snowflake.torproject.net/" ]

```
