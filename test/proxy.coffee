Proxy = require("../lib/proxy")

class Example1
  constructor: () ->

  method1: () ->
    1

  method2: () ->
    2

class Example1Proxy extends Proxy
  wrap: () ->
    super() + 1

exports.setUp = (callback) ->
  callback()

exports.example1 = (test) ->

  e = new Example1()

  test.equal e.method1(), 1
  test.equal e.method2(), 2

  _Example1Proxy = new Example1Proxy(Example1)
  p = new _Example1Proxy

  test.equal p.method1(), 2
  test.equal p.method2(), 3

  test.done()
