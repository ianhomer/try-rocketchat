# Background

Try Rocket.Chat

# TL;DR

    vi /etc/hosts

and add

```
127.0.0.1 chat.local
```

Create certificates (be patience this'll take several minutes)

    ./initialise-keys-and-certificates.sh

Start up

    docker-compose up -d

Access https://chat.local/

