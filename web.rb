#!/usr/bin/env ruby

require 'fileutils'
require 'bundler/inline'

def is_correct_directory_to_remove?(dir)
  !!(%r!^/home/pi/.rbenv/versions/! =~ dir)
end

begin
  gemfile do
    source 'https://rubygems.org'
    git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
    gem 'procon_bypass_man', github: 'splaspla-hacker/procon_bypass_man', branch: "edge"
    gem 'procon_bypass_man-web', github: 'splaspla-hacker/procon_bypass_man-web'
  end
rescue Bundler::Source::Git::GitCommandError => e
  if %r!If this error persists you could try removing the cache directory '([^']+)'! =~ e.to_s
    if is_correct_directory_to_remove?($1)
      FileUtiles.rm_rf($1)
      puts "Bundler::Source::Git::GitCommandErrorが起きたので問題のディレクトリを削除しました。"
    else
      raise "bundlerのキャッシュディレクトリを削除できませんでした"
    end
  end
end

ProconBypassMan::Web::Server.start
