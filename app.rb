#!/usr/bin/env ruby

require 'bundler/setup'
require 'procon_bypass_man'
require 'procon_bypass_man/splatoon2'

ProconBypassMan.tap do |pbm|
  pbm.logger = Logger.new("#{ProconBypassMan.root}/app.log", 5, 1024 * 1024 * 10)
  pbm.logger.level = :debug
end

ProconBypassMan.run(setting_path: "./setting.yml")
