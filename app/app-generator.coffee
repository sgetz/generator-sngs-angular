"use strict"
util = require("util")
path = require("path")
yeoman = require("yeoman-generator")
yosay = require("yosay")
chalk = require('chalk')


###
  Prompts
###
promptOne =
  type: "confirm"
  name: "someOption"
  message: "Would you like to enable this option?"
  default: true


###
  yeoman methods
###
config = ->
  #App Name Props
  @appName = @name
  @appNameSlug = @_.slugify(@appName)
  @appNameCamel = @_.camelize(@appNameSlug)

  #Create and Set Proj Root
  @rootProjectDir = path.join(@destinationRoot(), @appNameSlug)
  @mkdir @rootProjectDir
  @destinationRoot @rootProjectDir

  # App Path Props
  @tempDir = '.tmp'
  @srcDir = 'src'
  @buildDir = 'build'
  @buildUtilsDir = '.build-utils'
  @appDir = "#{@srcDir}/app"
  @utilDir = "#{@srcDir}/utils"
  @bowerDir = "#{@srcDir}/bower_components"

  # Set .yo-rc config
  @config.set 'coffeescript', true
  @config.set {
    @appName
    @appNameSlug
    @appNameCamel
    @rootProjectDir
    @tempDir
    @srcDir
    @buildDir
    @buildUtilsDir
    @appDir
    @utilDir
    @bowerDir
  }




init = ->
  @pkg = require("../package.json")
  @on "end", -> @installDependencies()  unless @options["skip-install"]

askFor = ->
  done = @async()
  @log yosay("Welcome to the marvelous SngsFrontend generator!")
  promptValSetterCb = (props) =>
    for own k,v of props
      @[k] = v
    done()

  prompts = [] # [promptOne]

  @prompt prompts, promptValSetterCb

app = ->
  @log chalk.magenta("creating new angular app: #{@appNameSlug}")
  #@bulkDirectory @srcDir, @srcDir
  @mkdir @srcDir
  @template "#{@srcDir}/_config.coffee", "#{@srcDir}/config.coffee"
  @template "#{@srcDir}/_index.html", "#{@srcDir}/index.html"
  @template "#{@srcDir}/_styles.less", "#{@srcDir}/styles.less"
  #
  @mkdir @appDir
  @template "#{@appDir}/_main.coffee", "#{@appDir}/main.coffee"
  @template "#{@appDir}/_main.coffee", "#{@appDir}/main.coffee"
  @template "#{@appDir}/_constants.json", "#{@appDir}/constants.json"
  @template "#{@appDir}/_app-controller.coffee", "#{@appDir}/app-controller.coffee"
  @template "#{@appDir}/_app.coffee", "#{@appDir}/app.coffee"
  #
  @mkdir @utilDir
  @template "#{@utilDir}/_general.coffee", "#{@utilDir}/general.coffee"
  @template "#{@utilDir}/_ngcoffee-base-controller.coffee", "#{@utilDir}/ngcoffee-base-controller.coffee"
  #
  @mkdir @tempDir
  @directory @buildUtilsDir, @buildUtilsDir

  @template "_bower.json", "bower.json"
  @template "_gitignore", ".gitignore"
  @template "_Gruntfile.coffee", "Gruntfile.coffee"
  @template "_package.json", "package.json"
  @template "_README.md", "README.md"
  @template  "_sublime-project.sublime-project", "#{@appNameSlug}-project.sublime-project"
  @template "bowerrc", ".bowerrc"
  @template "coffeelint.json", "coffeelint.json"
  @template "editorconfig", ".editorconfig"

  # Write the .yo-rc file
  #@config.save()


projectfiles = ->


printConfig = ->

###
  Create Genorator
###
SngsFrontendGenerator = yeoman.generators.NamedBase.extend {
  init
  config
  askFor
  app
  projectfiles
  printConfig
}

###
  Export Genorator
###
module.exports = SngsFrontendGenerator
