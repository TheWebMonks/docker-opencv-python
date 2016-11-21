#
# Development container base on Debian Jessie
#
# The container contains: python3.5.2, CMake, OpenCV
#
FROM debian:jessie

###################################################################################################################
# Download a lot of stuff ...
###################################################################################################################
RUN apt-get update && \
    apt-get install -y build-essential apt-utils cmake git libgtk2.0-dev pkg-config libavcodec-dev \
    libavformat-dev libswscale-dev python-dev python-numpy \
    libtbb2 libtbb-dev \
    libjpeg-dev libjasper-dev libdc1394-22-dev \
    python-opencv libopencv-dev libav-tools python-pycurl \
    libatlas-base-dev gfortran webp qt5-default libvtk6-dev zlib1g-dev unzip && \
    rm -rf /var/lib/apt/lists/*


###################################################################################################################
# Download sources & build OpenCV
###################################################################################################################
RUN curl -o opencv.zip -L https://github.com/Itseez/opencv/archive/2.4.13.zip

# Note ... this takes ages! 2hours...
RUN unzip opencv.zip && \
    mkdir -p opencv-2.4.13/release && \
    cd opencv-2.4.13/release/ && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_PYTHON_SUPPORT=ON -D WITH_XINE=ON -D WITH_TBB=ON .. && \
    make && make install && \
    cd /
#    cd / && \
#    rm -Rf opencv-2.4.13

# Adding docker-entrypoint & configure
ADD deployment/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod ugo+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

# Enter the bash by default
CMD ["bash"]
