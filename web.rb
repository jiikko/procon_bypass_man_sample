#!/usr/bin/env ruby

require 'bundler/inline'

ProconBypassMan.remove_bundler_cache_if_need do
  gemfile do
    source 'https://rubygems.org'
    git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
    gem 'procon_bypass_man', github: 'splaspla-hacker/procon_bypass_man', branch: "edge"
    gem 'procon_bypass_man-web', github: 'splaspla-hacker/procon_bypass_man-web'
  end
end

ProconBypassMan::Web::Server.start
