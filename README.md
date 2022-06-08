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

### Just edit robot!