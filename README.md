# docker-chrome
headless chrome

### Run chrome debug
```
docker run -d -p 9222:9222 --name chrome --cap-add=SYS_ADMIN rsysio/chrome:debug
```

### Run chromedriver
```
docker run -d -p 9515:9515 --name chromedriver --cap-add=SYS_ADMIN rsysio/chrome:driver
```

### Print python version
```
docker run -it --rm rsysio/chrome:py
```

### Run python script
```
docker run -it --rm --cap-add=SYS_ADMIN -v ${PWD}:/usr/src/app rsysio/chrome:py myscript.py
```

### docker-compose
```
version: '3.3'

services:

  myservice:
    image: rsysio/chrome:py
    cap_add:
      - SYS_ADMIN
    volumes:
      - .:/usr/src/app
    command: run.py
```
