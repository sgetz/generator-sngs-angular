###Gruntfile.coffee###

###allow loading of coffeescript modules###
require 'coffee-script/register'

###Load External Grunt/Build Config & Util Fn's###
gutils = require './<%= buildUtilsDir %>/grunt-utils'

module.exports = (grunt) ->

  ###Load Grunt Tasks###
  require('load-grunt-tasks')(grunt)

  ###
  Indivigual Grunt Task Configured Below
  ###

  ###pkg###
  pkg = grunt.file.readJSON 'package.json'


  ###Coffee Script Config###
  coffee =
    dev:
      expand: true
      cwd: '<%= srcDir %>'
      src: ['**/*.coffee']
      dest: '<%= tempDir %>'
      ext: '.js'
      options:
        bare: true
        sourceMap: true

  ###Coffeelint Config###
  coffeelint =
    options:
      configFile: 'coffeelint.json'
    dev: ['<%= srcDir %>/**/*.coffee', '!<%= srcDir %>/config.coffee', '!<%= bowerDir %>/**/*']

  ###LESS Config###
  less =
    dev:
      options:
        paths: ['<%= srcDir %>', '<%= bowerDir %>'] # place bower_components first to support mobile-angular-ui
      files:
        '<%= tempDir %>/styles.css': '<%= srcDir %>/styles.less'

  ###CSS Auto Prefixer###
  autoprefixer =
    options:
      browsers: ['last 2 versions', 'ie 9']
    dev_tmp_styles:
      src: '<%= tempDir %>/styles.css'

  ###RequireJS Config###
  requirejs:
    compile:
      options:
        baseUrl: '<%= tempDir %>'
        mainConfigFile: '<%= tempDir %>/config.js'
        out: '<%= buildDir %>/jface.js'

  ###Bower-Requirejs Config###
  bower =
    target:
      rjsConfig: '<%= tempDir %>/config.js'
      options:
        baseUrl: '<%= srcDir %>' # list bower paths as relitive to the src dir

  ###Copy Config###
  copy =
    dev_main:
      files: [
        {
          expand: true
          cwd: '<%= srcDir %>'
          src: ['**/*', '!**/*.coffee', '!**/*.less']
          dest: '<%= tempDir %>'
        }
      ]

  ###Clean Config###
  clean =
    dev_tmp: ['<%= tempDir %>']

  ###Watch Config###
  watch =
    options:
      livereload: true
    dev_main:
      files: ['<%= srcDir %>/**/*', '!<%= srcDir %>/**/*.coffee', '!<%= srcDir %>/**/*.less']
      tasks: 'copy:dev_main'
    dev_coffee:
      cwd: '<%= srcDir %>'
      files: ['<%= srcDir %>/**/*.coffee']
      tasks: ['coffeelint:dev', 'coffee:dev']
    dev_less:
      files: ['<%= srcDir %>/**/*.less']
      tasks: ['less:dev', 'autoprefixer:dev_tmp_styles']
    dev_tmp_config:
      files: ['<%= tempDir %>/config.js']
      task: ['bower']
      options:
        debounceDelay: 2000

  ###Connect Server Config###
  connect =
    dev_server:
      options:
        port: 8000
        hostname: '0.0.0.0'
        base: ['<%= tempDir %>', '.']
        keepalive: false
        middleware: (connect, options) ->
          middlewares = []
          for basePath in options.base
            middlewares.push connect.static(basePath)
            middlewares.push connect.directory(basePath)
          middlewares

  ###Task Config Obj###
  taskConfig = {
    pkg
    coffee
    coffeelint
    less
    autoprefixer
    bower
    copy
    clean
    watch
    connect
  }

  ###Inishilize Grunt Config###
  grunt.initConfig taskConfig

  ###Custom Grunt Tasks###
  customTasks =
    'default': "coffeelint:dev clean:dev_tmp copy:dev_main coffee:dev less:dev autoprefixer:dev_tmp_styles bower connect:dev_server watch"
  ###Register Custom Tasks###
  for own name, tasks of customTasks
    grunt.registerTask(name, gutils.split(tasks))
