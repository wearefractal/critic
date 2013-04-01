request = require 'request'
cheerio = require 'cheerio'
async = require 'async'
markov = require 'markov'

fakeBrowser =
  headers:
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31"

getTorrentURLs = (uri, cb) ->
  request uri, fakeBrowser, (err, res, body) ->
    return cb err if err?
    $ = cheerio.load body
    urls = $("a.detLink").map ->
      el = $ @
      return "http://thepiratebay.se#{el.attr('href')}"
    cb null, urls

fetchTorrent = (uri, cb) ->
  request uri, fakeBrowser, (err, res, body) ->
    return cb err if err?
    $ = cheerio.load body

    comments = $(".comment").map ->
      el = $ @
      return el.text()

    out =
      comments: comments

    cb null, out

getTorrents = (uri, cb) ->
  getTorrentURLs uri, (err, urls) ->
    return cb err if err?
    async.map urls, fetchTorrent, cb

module.exports = critic =
  create: (search, cb) ->
    if typeof search is 'function'
      cb = search
      uri = "http://thepiratebay.se/top/all"
    else
      uri = "http://thepiratebay.se/search/#{search}/0/7/0"

    getTorrents uri, (err, torrents) ->
      return cb err if err?

      out =
        markov: markov 20
        comments: []
        random: -> out.markov.pick()
        respond: (s) -> out.markov.respond(s).join ' '

      out.comments = out.comments.concat t.comments for t in torrents
      async.each out.comments, out.markov.seed, ->
        cb null, out