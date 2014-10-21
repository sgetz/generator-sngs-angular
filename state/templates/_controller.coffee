###
<%= newStateControllerName %>
###

define [
  'app/app'
  'utils/ngcoffee-base-controller'
  ],
  (app, BaseController) ->
    class <%= newStateControllerName %> extends BaseController
      @name: '<%= newStateControllerName %>'
      @register app
      @inject '$scope AppConstants'
      initialize: ->
        @$scope.scopeName = '<%= newStateControllerName %>'
