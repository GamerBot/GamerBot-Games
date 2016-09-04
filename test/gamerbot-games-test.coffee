Game = require("GamerBot-Game")

class Destiny extends Game
  lfg: ->
    return true

  events: ->
    return {
      CoO:
        name: "Court of Oryx"
        maxplayers: 3
      CoE:
        name: "Challenge of Elders"
        maxplayers: 3
      KFHM:
        name: "King's Fall - Hard Mode"
        maxplayers: 6
    }

  name: ->
    return "Destiny"

  platforms: ->
    return ['PS4','XBONE']

Helper = require('hubot-test-helper')
helper = new Helper('../src/GamerBot-Games.coffee')

expect = require('chai').expect

Games = require('../src/Games.coffee')

describe 'GamerBot-Games', ->
  beforeEach ->
    @room = helper.createRoom()
    @games = new Games @room.robot

  afterEach ->
    @room.destroy()

  it 'registers a new game', ->
    dtg = new Destiny @room.robot

    @room.robot.emit "gamerbot.games.register", ({ ident: "dtg", name: "Destiny", builder: dtg.constructor })
    @room.user.say('bob','.games').then =>
      expect(@room.messages).to.eql [
        [ "bob",".games" ]
        [ "hubot", "```Game List:\ndtg ... Destiny\n```" ]
      ]

  it 'fetches a game', ->
    dtg = new Destiny @room.robot

    @room.robot.emit "gamerbot.games.register", ({ ident: "dtg", name: "Destiny", builder: dtg.constructor })

    destiny = games.fetch_game('dtg').builder
    expect(destiny.name).to.eql('Destiny')
