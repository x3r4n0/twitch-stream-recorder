FROM python:3-alpine


RUN apk add --no-cache tini

RUN apk add --no-cache ffmpeg

RUN python -m pip install --no-cache-dir --upgrade streamlink requests

COPY ./twitch-recorder.py /opt

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/sbin/tini", "--", "python", "/opt/twitch-recorder.py"]
