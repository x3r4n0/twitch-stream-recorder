FROM python:3.9-slim

ENV ROOT_PATH="" TWITCH_USERNAME="" TWITCH_CLIENT_ID="" TWITCH_CLIENT_SECRET=""
ENV streamlinkVersion=3.2.0

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --no-install-suggests -y ffmpeg gosu

COPY ./config.py /opt
COPY ./twitch-recorder.py /opt
COPY ./entrypoint.sh /opt

RUN ["chmod", "+x", "/opt/entrypoint.sh"]

RUN python -m pip install --no-cache-dir --upgrade pip
RUN python -m pip install --no-cache-dir --upgrade streamlink==${streamlinkVersion} requests

ENTRYPOINT [ "/opt/entrypoint.sh" ]
CMD ["python", "/opt/twitch-recorder.py"]
