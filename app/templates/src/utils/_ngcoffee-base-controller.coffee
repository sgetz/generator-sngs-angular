###
From http://www.devign.me/angular-dot-js-coffeescript-controller-base-class
###
define [
  'utils/general'
  ],
  (utlsGeneral) ->


    class BaseController
      @register: (app, name) ->
        name ?= @name or @toString().match(/function\s*(.*?)\(/)?[1]
        app.controller name, @

      @inject: (args...) ->
        @$inject = utlsGeneral.splitStrList args

      constructor: (args...) ->
        for key, index in @constructor.$inject
          @[key] = args[index]

        for key, fn of @constructor.prototype
          continue unless typeof fn is 'function'
          continue if key in ['constructor', 'initialize'] or key[0] is '_'
          @$scope[key] = fn.bind?(@) or _.bind(fn, @)

        @initialize?()

    ###Return BaseController Class###


    BaseController
