#!/usr/bin/env ruby

require 'bundler/inline'

def is_correct_directory_to_remove?(dir)
  !!(%r!^/home/pi/.rbenv/versions/! =~ dir)
end

gemfile do
  source 'https://rubygems.org'
  git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
  gem 'procon_bypass_man-web', "0.1.3"
end

ProconBypassMan::Web::Server.start
