FROM alpine:3.23.3

RUN apk update && apk add --no-cache python3 sox py-pip

WORKDIR /app
COPY requirements.txt /app
COPY audio-processor.py /app



RUN python -m pip install -r requirements.txt --break-system-packages

ENTRYPOINT ["/usr/bin/python3", "audio-processor.py" ]