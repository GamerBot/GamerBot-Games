# Description
#   Games class for managing registered game list
#
# Author:
#   Shawn Sorichetti <ssoriche@gmail.com>

util = require('util')

class Games
  constructor: (@robot) ->
    @games = {}

  register_game: (game) =>
    @games[game.ident] = game

  get_games: =>
    @games

  fetch_game: (ident) =>
    return @games[ident]

module.exports = Games
