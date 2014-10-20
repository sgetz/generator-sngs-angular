###
Main Application Controller
###

define [
    'angular'
    'app/app'
    'utils/ngcoffee-base-controller'
  ],
  (angular, app, BaseController) ->
    class AppController extends BaseController
      @name: 'AppController'
      @register app
      @inject '$scope AppConstants'
      initialize: ->
        @$scope.appName = @AppConstants.appName
