# Use the official Python image.
# https://hub.docker.com/_/python
FROM ubuntu:18.04

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update
RUN apt install -y vim
# Install production dependencies.
RUN apt install -y python3-dev
RUN apt install -y python3-pip
RUN pip3 install Flask gunicorn


RUN pip3 install --upgrade google-api-python-client
RUN pip3 install requests
RUN pip3 install boto3==1.9.156

RUN python3 -m pip install --upgrade pip setuptools wheel
RUN apt-get install -y -qq build-essential swig git libpulse-dev libasound2-dev

RUN apt-get -y update
RUN apt install -y libopencv-dev
RUN pip3 install opencv-python

RUN pip3 install tensorflow==2.0.0-rc1
RUN pip3 install matplotlib

RUN pip3 uninstall -y  Pillow
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libjpeg8-dev
RUN pip3 install Pillow

RUN pip3 install scipy

CMD exec /bin/bash
