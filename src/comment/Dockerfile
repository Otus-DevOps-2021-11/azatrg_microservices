FROM alpine:3.14

WORKDIR /app
COPY . /app

RUN apk update \
    && apk add --no-cache ruby=2.7.5-r0 ruby-dev=2.7.5-r0 ruby-full=2.7.5-r0 g++=10.3.1_git20210424-r2 make=4.3-r0 \
    && gem install bundler:1.17.2 \
    && bundle install \
    && apk del ruby-dev g++ make

ENV COMMENT_DATABASE_HOST=comment_db \
    COMMENT_DATABASE=comments

CMD ["puma"]
