# cloud9-docker

cloud9 docker image

cloud9-core https://github.com/c9/core

## run

```
docker run -d -p 80:80 cloverzrg/cloud9 --auth username:password
# use -a : to force no login
```


### recommend
```
docker run -d -m 256M -p 127.0.0.1:8090:80 -v $HOME/docker-volume/cloud9/workspace:/workspace cloverzrg/cloud9 --auth username:password
```
ensure that the folder have right permissions.

#### user settng:
/root/.c9/user.settings

#### workspace
/workspace

#### nginx conf example
```
server {
    listen 80;
    server_name ide.example.com;
    location / {
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   Host      $http_host;
        proxy_pass         http://127.0.0.1:8090;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        # support WebSocket
    }
}
```