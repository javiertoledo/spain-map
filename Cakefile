fs = require 'fs'

{print} = require 'util'
{exec} = require 'child_process'

includes = "src/spain-map.coffee src/main.coffee"

build = (callback) ->
  coffee = exec "coffee -j interactive-spain-map.js -o lib -c #{includes}"
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'build', 'Build lib/ from src/', ->
  build()