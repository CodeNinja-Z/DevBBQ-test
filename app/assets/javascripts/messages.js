$(document).on('ready page:load', function(){
  $('#messages').hide();
  $('#switch-btn').on('click', function(){
    $('#messages').toggle();
  });
});