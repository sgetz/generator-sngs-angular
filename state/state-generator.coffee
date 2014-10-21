'use strict'
util = require('util')
yeoman = require('yeoman-generator')


initializing = ->
  @log("You called the sngs-angular subgenerator with the argument #{@name}.")
  @stateName = @name
  @stateNameSlug = @_.slugify(@stateName)
  @stateNameCamel = @_.camelize(@stateNameSlug)
  @stateNameClass = @_.classify(@stateNameSlug)

  @appGeneratorConfig = @config.getAll()
  @relToReq = (path) ->
    path.replace("#{@appGeneratorConfig['requireJSRoot']}/", '')
  @statesDir = @appGeneratorConfig['statesDir']
  #
  @newStateDir = "#{@statesDir}/#{@stateNameSlug}"
  @newStateView = "#{@newStateDir}/#{@stateNameSlug}.html"
  @newStateRoute = "#{@newStateDir}/#{@stateNameSlug}-route.coffee"
  @newStateLess = "#{@newStateDir}/#{@stateNameSlug}.less"
  @newStateController = "#{@newStateDir}/#{@stateNameSlug}-controller.coffee"
  @newStateControllerName = @_.classify("#{@stateNameSlug}-controller")
  @newStateControllerInstanteName = @_.camelize("#{@stateNameSlug}-controller")
  #TODO: set base controller name and path as var and remove hardcoding from controller template



writing = ->
  @mkdir @newStateDir
  @template "_view.html", @newStateView
  @template "_route.coffee", @newStateRoute
  @template "_less.less", @newStateLess
  @template "_controller.coffee", @newStateController


  @log @config.getAll()
  #this.src.copy('somefile.js', 'somefile.js')


###
  Create Genorator
###
SngsFrontendStateGenerator = yeoman.generators.NamedBase.extend {
  initializing
  writing
}

###
  Export Genorator
###
module.exports = SngsFrontendStateGenerator
