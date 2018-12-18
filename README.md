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

# System configuration

Through the UI set up administrator account.  In the settings you can set 

* E2E Encryption -> choose for messages to be encrypted or not - default is false
* Retention policy -> pruning old messages - default is false
* OTR (Off the record) -> allow end to end encrypted one-to-one messages - default is true
* Message 
  * -> allow message editing / deleting - default is true
  * work black list configuration
* LDAP -> user / credentials configuration
* Accounts > Iframe -> enable iframe support - default is false

# Embedding in web site

See web directly for embedding chat in a web site

# View chat database

    docker exec -it chat-db /bin/bash

then

    mongo
    
then

    use rocketchat

View all messages

    db.rocketchat_message.find({})

View all rooms, roles

    db.rocketchat_room.find({})
    db.rocketchat_roles.find({})
    db.users.find({})

# Clean reinstall

    docker-compose down
    docker container prune
    rm -Rf ./data/
    docker-compose up -d
    