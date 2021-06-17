#!/usr/bin/env ruby
require 'bundler/setup'
require 'procon_bypass_man'

ProconBypassMan.run do
  prefix_keys_for_changing_layer [:zr, :r, :zl, :l]

  layer :up, mode: :manual do
    flip :zr, if_pushed: :zr, force_neutral: :zl
    flip :zl, if_pushed: [:y, :b, :zl]
    flip :down, if_pushed: :down
    macro :fast_return, if_pushed: [:y, :b, :down]
  end
  layer :right, mode: :guruguru
  layer :left do
    # no-op
  end
  layer :down do
    flip :zl
  end
end
