# docker-chrome
headless chrome, python3


### Print python version
```
docker run -it --rm chrome
```

### Run python script
```
docker run -it --rm --cap-add=SYS_ADMIN -v ${PWD}:/usr/src/app chrome myscript.py
```

### docker-compose
```
version: '3.3'

services:

  myservice:
    image: rsysio/chrome:latest
    cap_add:
      - SYS_ADMIN
    volumes:
      - .:/usr/src/app
    command: run.py
```
