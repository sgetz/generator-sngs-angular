require [
  'angular'
  'app/app'
  'app/app-controller'
  ],
  (angular, app) ->
    ###Bootstrap angular###
    angular.element('html').attr('ng-app', app.name)
    angular.bootstrap(angular.element('html')[0], [app.name])
