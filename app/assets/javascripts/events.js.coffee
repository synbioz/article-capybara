# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  $('#guests').click ->
    link = $(this).attr('href') + '.json'
    ul = $('ul#guests_target')
    $.getJSON link, (data, status) ->
      data.forEach (guest) ->
        ul.append('<li class="guest">' + guest.name + '</li>')
    false
