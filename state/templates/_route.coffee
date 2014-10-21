###
###

define [
  'app/app'
  '<%= relToReq(newStateController) %>'
  ],
  (app) ->
    app.config ($stateProvider) ->
      $stateProvider.state '<%= stateNameSlug %>', {
        url: '/<%= stateNameSlug %>'
        templateUrl: '<%= relToReq(newStateView) %>'
        controller: '<%= newStateControllerName %> as <%= newStateControllerInstanteName %>'
        data: {}
        resolve: {}
      }
