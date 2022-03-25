FROM python:3-slim

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --no-install-suggests -y ffmpeg

RUN python -m pip install --no-cache-dir --upgrade pip
RUN python -m pip install --no-cache-dir --upgrade streamlink requests

COPY ./twitch-recorder.py /opt

CMD ["python", "/opt/twitch-recorder.py"]
