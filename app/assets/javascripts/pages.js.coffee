# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    Morris.Line
      element: 'tags_charts',
      data: $('tags_charts').data('tagsinfo')
      xkey: 'y',
      ykeys: ['a', 'b'],
      labels: ['Series A', 'Series B']