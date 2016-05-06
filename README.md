# docker-devtools-linuxbrew
DevOps tools using [LinuxBrew.sh](http://LinuxBrew.sh)

On Docker Hub at [shane/devtools-linuxbrew](https://hub.docker.com/r/shane/devtools-linuxbrew/)

### Using

Make a named container using your `shane/devtools-linuxbrew` derived image:

    docker run --name my_devtools shane/devtools-linuxbrew:tip

Then compose your devtool container using `--volumes-from my_devtools` which shares `/brew` between containers

    docker run --rm -it --volumes-from my_devtools ubuntu:xenial /brew/enter

