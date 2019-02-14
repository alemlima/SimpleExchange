# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Just a test
$(document).ready ->
 
 exchange = -> 
  if $('#amount').val() == ''
    $('#amount').focus()
  else  
    if $('form').attr('action') == '/convert'
        $.ajax '/convert',
            type: 'GET'
            dataType: 'json'
            data: {
                    source_currency: $("#source_currency").val(),
                    target_currency: $("#target_currency").val(),
                    amount: $("#amount").val()
                  }
            error: (jqXHR, textStatus, errorThrown) ->
              alert textStatus
            success: (data, text, jqXHR) ->
              $('#result').html(data.value)
        return false;
        

 timeout = 0
 $('#amount').keyup ->
  clearTimeout(timeout)
  timeout = setTimeout(exchange, 1500)

 $('#inverter').click ->
  source = $('#source_currency').val()
  $('#source_currency').val($('#target_currency').val())
  $('#target_currency').val(source)
  exchange()