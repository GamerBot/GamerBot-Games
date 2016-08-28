Helper = require('hubot-test-helper')
helper = new Helper('../src/gamerbot-games.coffee')

expect = require('chai').expect

Games = require('../src/Games.coffee')

describe 'gamerbot-games', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'registers a new game', ->
    @room.robot.emit "gamerbot.games.register", ({ ident: "dtg", name: "Destiny" })
    @room.user.say('bob','.games').then =>
      expect(@room.messages).to.eql [
        [ "bob",".games" ]
        [ "hubot", "```Game List:\ndtg ... Destiny\n" ]
      ]
