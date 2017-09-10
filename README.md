# docker-chrome
headless chrome, python3


## Python version
```
docker run -it --rm chrome
```

## Run python script
```
docker run -it --rm --cap-add=SYS_ADMIN -v ${PWD}:/usr/src/app chrome myscript.py
```
