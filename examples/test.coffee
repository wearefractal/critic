critic = require '../'

###
critic.create "affleck", (err, gen) ->
  return console.log err if err?

  console.log "#{gen.comments.length} loaded"
  console.log gen.respond "ben affleck"
###

critic.create "walking dead", (err, gen) ->
  return console.log err if err?
  console.log "#{gen.comments.length} loaded"
  console.log gen.respond "finale"