# cloud9-docker
cloud9 docker image
cloud9-core https://github.com/c9/core
## run

### simple
```
docker run -d -p 80:80 cloverzrg/cloud9 --auth username:password
```

### recommend
```
docker run -d -m 256M -p 127.0.0.1:8090:80 -v $HOME/docker-volume/cloud9/workspace:/workspace -v $HOME/docker-volume/cloud9/c9.settings:/root/.c9/user.settings cloverzrg/cloud9 --auth username:password
```
##### nginx conf
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