FROM python:3-alpine

RUN apk update && apk upgrade && apk add ffmpeg

RUN python -m pip install --no-cache-dir --upgrade pip
RUN python -m pip install --no-cache-dir --upgrade streamlink requests

COPY ./twitch-recorder.py /opt

CMD ["python", "/opt/twitch-recorder.py"]
