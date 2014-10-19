requirejs.config {
  #baseUrl: '.tmp      '
  paths: {
  }
  shim:
    'jquery': exports: '$'
    'lodash': exports: '_'
    'angular':
      exports: 'angular'
      deps: ['jquery']
    'restangular': deps: ['angular']
    'angular-ui-router': deps: ['angular']
    'angular-ui-utils': deps: ['angular']
    'mobile-angular-ui': deps: ['angular', 'jquery'] # ?jquery
    'json': deps: ['text']
    'goog': deps: ['propertyParser', 'async']
    'font': deps: ['propertyParser']
    'mdown': deps: ['text']
    'bootstrap': deps: ['jquery']
    'angular-filter': deps: ['angular']
    'angular-animate': deps: ['angular']
    'angular-touch': deps: ['angular']
    'angular-gestures': deps: ['angular', 'hammerjs']

  ###
  packages: []
  ###
}

###Load the main app module to start the app###
requirejs(["app/main"])
