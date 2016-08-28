Games = require './src/Games'
fs = require 'fs'
path = require 'path'

module.exports = (robot, scripts) ->
  scriptsPath = path.resolve(__dirname, 'src')
  robot.loadFile(scriptsPath, 'GamerBot-Games.coffee')
  return new Games robot

