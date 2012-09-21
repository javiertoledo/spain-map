fs = require 'fs'

{print} = require 'util'
{exec} = require 'child_process'

includes = "src/spain-map.coffee src/main.coffee"

logErrors = (result, callback) ->
  result.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  result.stdout.on 'data', (data) ->
    print data.toString()
  result.on 'exit', (code) ->
    callback?() if code is 0

build = (callback) ->
  result = exec "coffee -j spain-map.js -o lib -c #{includes}"
  logErrors result, callback

minimize = (callback) ->
  result = exec "uglifyjs --unsafe -o lib/spain-map.min.js lib/spain-map.js"
  logErrors result, callback

task 'build', 'Build lib/ from src/', ->
  build minimize