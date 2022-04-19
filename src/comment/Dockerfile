FROM alpine:3.14

WORKDIR /app
COPY . /app

RUN apk update \
    && apk add --no-cache ruby ruby-dev ruby-full g++ make gcc musl-dev \
    && gem install bundler:1.17.2 \
    && bundle install \
    && apk del ruby-dev g++ make \
    && addgroup -g 2000 comment \
    && adduser -u 2000 -G comment -s /bin/sh -D comment

USER 2000

ENV COMMENT_DATABASE_HOST=comment_db \
    COMMENT_DATABASE=comments

CMD ["puma"]
