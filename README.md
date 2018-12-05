# Simple web service from k8s workshop

Taken from https://github.com/rumyantseva/nsk

```sh
docker build -t go-server .
docker run -d -p 8080:8080 -t go-server
```
