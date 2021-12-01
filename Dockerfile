
from ubuntu:latest

#RUN sudo apt-get update && apt-get install -y software-properties-common gcc && \
#    add-apt-repository -y ppa:deadsnakes/ppa

#RUN apt-get update && apt-get install -y python3 python3-distutils python3-pip python3-apt

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

#RUN apt install python3-dev \
#    && pip3 install --upgrade pip

WORKDIR /app

COPY . /app

RUN pip3 --no-cache-dir install -r requirements.txt

EXPOSE 8090

ENTRYPOINT ["python3"]
CMD ["app.py"]


