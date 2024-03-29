# Robot Framework Docker

## What's that?

Simple and light image to run your robots

## How run it?

### Go to project location

```
cd robot-framework-docker
```

### Build the robot image

```
docker build -t robot .
```

### Run example robot

```
docker run -v `pwd`/robot:/srv/robot robot
```

if you are using macos with appple silicon, add platform information

```
docker --platform linux/amd64 run -v `pwd`/robot:/srv/robot robot
```

We are specifying platform to support ARM machines eg. MacBooks

### Just edit robot!

```
*** Settings ***
Library    Browser

*** Tasks ***
Vistit Google
    Start Browser
    Go To    https://google.com
    End Browser

*** Keywords ***
Start Browser
    New Browser    firefox    headless=0    slowMo=0.1
    New Context    viewport={'width': 1920, 'height': 1080}    acceptDownloads=true    recordVideo={'dir': 'video'}
    New Page

End Browser
    Close Browser

```

### Install anaconda
https://www.anaconda.com/products/distribution