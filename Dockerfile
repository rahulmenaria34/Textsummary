FROM python:3.6-slim

RUN apt-get update -y 
    #apt-get install -y python-pip python-dev && \
    #apt-get install -y build-essential cmake && \
    #apt-get install -y libopenblas-dev liblapack-dev && \
    #apt-get install -y libx11-dev libgtk-3-dev


COPY ./requirements.txt /requirements.txt

WORKDIR /

RUN pip3 install -r requirements.txt
RUN pip install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
COPY . /

#EXPOSE 8080

ENTRYPOINT [ "python3" ]

CMD [ "server.py" ]

