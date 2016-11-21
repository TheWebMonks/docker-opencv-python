# Docker OpenCV Python image

This is a Docker development image for [OpenCV](http://opencv.org/) 
projects with Python based on Debian Jessie x86_64. 

Libraries inside:

* [Python 2.7](https://www.python.org/)
* [OpenCV 2.4.13](http://opencv.org/)
* [CMake 2.8.12.2](https://cmake.org/)
* [Numpy](http://www.numpy.org/)

## Usage

Download:
```
$ docker pull lukin0110/docker-opencv-python
```

Run python shell:
```
$ docker run -it lukin0110/docker-opencv-python python
```

Run a bash shell:
```
$ docker run -it lukin0110/docker-opencv-python bash
```

## Mount points

The container has 2 mount points:

* `/src`: mount a local source code directory. You need this to execute your code in the container.
* `/out`: mount a local out directory if your scripts produce output.

Examples:
```
$ docker run -it -v your_source:/src lukin0110/docker-opencv-python python /src/myscript.py
$ docker run -it -v your_out:/out lukin0110/docker-opencv-python python /src/myscript.py

$ docker run -it -v your_source:/src -v your_out:/out lukin0110/docker-opencv-python python /src/myscript.py
```

[More info about mounting](https://docs.docker.com/engine/tutorials/dockervolumes/).

**Note**: on OSX you need to add the full path of the directory that you want to mount. 
E.g.: `docker run -v /Users/johndoe/your_project/your_source:/src`.
