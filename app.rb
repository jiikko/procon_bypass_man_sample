#!/usr/bin/env ruby

require "bundler/inline"

gemfile do
  source 'https://rubygems.org'
  git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
  gem 'procon_bypass_man', '0.2.0'
end

ProconBypassMan.configure do |config|
  config.root = File.expand_path(__dir__)
  config.logger = Logger.new("#{ProconBypassMan.root}/app.log", 5, 1024 * 1024 * 10)
  config.logger.level = :debug

  # バイパスするログを全部app.logに流すか
  config.verbose_bypass_log = false

  # webからProconBypassManを操作できるwebサービス
  # config.api_servers = ['https://pbm-cloud.herokuapp.com']

  # エラーが起きたらerror.logに書き込みます
  config.enable_critical_error_logging = true

  # pbm-cloudで使う場合はnever_exitにtrueをセットしてください. trueがセットされている場合、不慮の事故が発生してもプロセスが終了しなくなります
  config.never_exit_accidentally = true

  # 毎秒行ったIOをログに出力するか
  config.io_monitor_logging = false

  # 接続に成功したらコントローラーのHOME LEDを光らせるか
  config.enable_home_led_on_connect = true

  # 操作が高頻度で固まるときは、 gadget_to_procon_interval の数値は大きくしてください
  config.bypass_mode = { mode: :normal, gadget_to_procon_interval: 5 }
end



ProconBypassMan.run(setting_path: "./setting.yml")
