FROM ruby:2.4-stretch as pivotal-docs-site

RUN mkdir -p /docs/docs-book

WORKDIR /docs/docs-book

COPY docs-book/Gemfile docs-book/Gemfile.lock ./

RUN bundle install

ADD docs-book/ .
COPY docs-content /docs/docs-content/
COPY docs-layout /docs/docs-layout/

# Install nodejs, which appears to be a required dependency to be able to run bookbinder
RUN gem install execjs
RUN apt-get update && apt-get install -y nodejs

ENTRYPOINT bundle exec bookbinder watch
