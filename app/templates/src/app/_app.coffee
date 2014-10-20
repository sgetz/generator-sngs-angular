define [
  'jquery'
  'lodash'
  'angular'
  'json!app/constants.json'
  'es6-shim'
  'angular-ui-router'
  'angular-ui-utils'
  'restangular'
  'mobile-angular-ui'
  'angular-filter'
  'angular-animate'
  'angular-touch'
  'angular-gestures'
  'async!http://maps.google.com/maps/api/js?sensor=false'
  'font!google,families:[Tangerine,Cantarell]'
  ],
  ($, _, angular, constants) ->
    app = angular.module constants.appName, [
      'ui.router'
      'ui.utils'
      'restangular'
      'mobile-angular-ui'
      'angular.filter'
      'ngAnimate'
      'ngTouch'
      'angular-gestures'
    ]
    app.constant 'AppConstants', constants

    #return the app object
    app
