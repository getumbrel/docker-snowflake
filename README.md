#### Building and Running:
``` 
docker-compose up
```

#### To Re-build and Run:
``` 
docker-compose up --build 
```

#### Adding Custom URLs:
To add custom URLs before building the image change the URLs in ENTRYPOINT to your desired URLs. Default URLs are shown below.

``` dockerfile
ENTRYPOINT [ "proxy" , "--broker" , "https://snowflake-broker.bamsoftware.com/" , "--stun" , "stun:stun.l.google.com:19302" , "--relay" , "wss://snowflake.bamsoftware.com/" ]

```
