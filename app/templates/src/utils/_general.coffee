define [
  'angular'
  'lodash'
  ],
  (angular, _) ->
    ###splitStrList - split string on , and whitspaces###
    splitStrList = (strList) ->
      if angular.isArray strList and strList.length > 1
        return strList
      return strList[0].trim().split(/,?\s+/)

    {
      splitStrList
    }
