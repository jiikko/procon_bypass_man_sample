#!/usr/bin/env ruby

require 'bundler/inline'

ProconBypassMan.remove_bundler_cache_if_need do
  gemfile do
    source 'https://rubygems.org'
    git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
    gem 'procon_bypass_man', github: 'splaspla-hacker/procon_bypass_man', branch: "edge"
    gem 'procon_bypass_man-splatoon2', github: 'splaspla-hacker/procon_bypass_man-splatoon2', branch: "0.1.0"
  end
end

ProconBypassMan.tap do |pbm|
  pbm.logger = Logger.new("#{ProconBypassMan.root}/app.log", 5, 1024 * 1024 * 10)
  pbm.logger.level = :debug
  pbm.root = File.expand_path(__dir__)
end

ProconBypassMan.run(setting_path: "./setting.yml")
