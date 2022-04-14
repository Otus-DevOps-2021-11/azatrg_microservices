FROM alpine:3.14

WORKDIR /app
COPY . /app

RUN apk update \
    && apk add --no-cache ruby ruby-dev ruby-full g++ make gcc musl-dev \
    && gem install bundler:1.17.2 \
    && bundle install \
    && apk del ruby-dev g++ make \
    && addgroup -g 2000 ui \
    && adduser -u 2000 -G ui -s /bin/sh -D ui

USER 2000

ENV POST_SERVICE_HOST=post \
    POST_SERVICE_PORT=5000 \
    COMMENT_SERVICE_HOST=comment \
    COMMENT_SERVICE_PORT=9292

CMD ["puma"]
