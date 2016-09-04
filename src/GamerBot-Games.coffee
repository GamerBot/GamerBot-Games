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

Games = require('./Games.coffee')

module.exports = (robot) ->
  @games = new Games robot

  robot.on "gamerbot.games.register", (game) =>
    @games.register_game game

  robot.hear /^[\.!]games$/i, (msg) =>
    nick = msg.message.user.name.toLowerCase()
    games_list = @games.get_games()

    game_list = ""
    for game in Object.keys(games_list)
      game_list += "#{games_list[game].ident} ... #{games_list[game].name}\n"

    msg.send "```Game List:\n#{game_list}```"
    msg.finish()
