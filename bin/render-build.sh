#!/usr/bin/env bash
# exit on error
set -o errexit

# builds the back end code
bundle install
bundle exec rails db:migrate
bundle exec rails db:seed # if you have seed data, run this command for the initial deploy only
