#!/usr/bin/env ruby

require 'bundler/setup'
require 'procon_bypass_man'
require 'procon_bypass_man/splatoon2'

ProconBypassMan.tap do |pbm|
  pbm.logger = "./app.log"
  pbm.logger.level = :debug
end

ProconBypassMan.run(setting_path: "./setting.yml")
