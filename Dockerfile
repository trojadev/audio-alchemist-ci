FROM alpine:3.23.3

RUN apk update && apk add --no-cache python3 sox py-pip

WORKDIR /app

RUN addgroup -g 10001 appgroup && \
    adduser -u 10001 -G appgroup -s /bin/bash -D appuser

RUN mkdir -p /data/processed_files/ && chown -R appuser:appgroup /data/processed_files/

USER appuser

COPY --chown=appuser:appgroup audio-processor.py /app


ENTRYPOINT ["/usr/bin/python3", "audio-processor.py" ]