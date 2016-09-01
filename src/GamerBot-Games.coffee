# Description
#   GamerBot Games Manager
#
# Commands:
#   .games - List of games
#
# Notes:
#
# GamerBot-Game module emits a gamerbot.games.register
# event with the game details (ident and name).
#
# Additional access to registered games is available via the
# GamerBot-Games class.
#
# Author:
#   Shawn Sorichetti <ssoriche@gmail.com>

module.exports = (robot) ->
  robot.on "gamerbot.games.register", (game) =>
    games = robot.brain.get "gamerbot.games"
    games ?= {}
    games[game.ident] = game
    robot.brain.set "gamerbot.games", games

  robot.hear /^[\.!]games$/i, (msg) =>
    nick = msg.message.user.name.toLowerCase()
    games = robot.brain.get "gamerbot.games"
    games ?= {}

    game_list = ""
    for game in Object.keys(games)
      game_list += "#{games[game].ident} ... #{games[game].name}\n"

    msg.send "```Game List:\n#{game_list}"
