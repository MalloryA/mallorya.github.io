#!/bin/sh

exec docker run -ti --rm -v=`pwd`:/app --workdir=/app -p=4000:4000 ruby sh -c 'bundle install && bundle exec jekyll serve --host="*"'
