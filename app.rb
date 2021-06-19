#!/usr/bin/env ruby

require 'procon_bypass_man'
require 'procon_bypass_man-splatoon2'

ProconBypassMan.tap do |pbm|
  pbm.logger = "./app.log"
  pbm.logger.level = :debug
end

fast_return = ProconBypassMan::Splatoon2::Macro::FastReturn
guruguru = ProconBypassMan::Splatoon2::Mode::Guruguru

ProconBypassMan.run do
  install_macro_plugin fast_return
  install_mode_plugin guruguru

  prefix_keys_for_changing_layer [:zr, :r, :zl, :l]

  layer :up, mode: :manual do
    flip :zr, if_pressed: :zr, force_neutral: :zl
    flip :zl, if_pressed: [:y, :b, :zl]
    flip :down, if_pressed: :down
    macro fast_return.name, if_pressed: [:y, :b, :down]
  end
  layer :right, mode: guruguru.name
  layer :left do
  end
  layer :down do
    flip :zl
  end
end

