FROM python:3.6-alpine

WORKDIR /app
COPY . /app

RUN apk --no-cache --update add build-base=0.5-r2 && \
    pip install --no-cache-dir --upgrade pip==21.3.1 && \
    pip install --no-cache-dir -r /app/requirements.txt && \
    apk del build-base \
    && addgroup -g 2000 post \
    && adduser -u 2000 -G post -s /bin/sh -D post

USER 2000

ENV POST_DATABASE_HOST=post_db \
    POST_DATABASE=posts

ENTRYPOINT ["python3", "post_app.py"]
