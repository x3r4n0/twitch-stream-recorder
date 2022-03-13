FROM python:3.9-slim

ENV streamlinkVersion=3.2.0

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --no-install-suggests -y ffmpeg

COPY ./twitch-recorder.py /opt

RUN python -m pip install --no-cache-dir --upgrade pip
RUN python -m pip install --no-cache-dir --upgrade streamlink==${streamlinkVersion} requests

CMD ["python", "/opt/twitch-recorder.py"]
