FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /home/selenium

RUN apt update

RUN apt install -y git vim python3-pip tox ruby xvfb curl wget openjdk-11-jdk-headless firefox && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

RUN wget -O /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/v1.11.0/bazelisk-linux-amd64
RUN chmod +x /usr/local/bin/bazel

RUN wget -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz \
  && tar -C /usr/local/bin -zxf /tmp/geckodriver.tar.gz
RUN chmod +x /usr/local/bin/geckodriver

RUN pip install tox

RUN ln -s /usr/bin/python3 /usr/bin/python
