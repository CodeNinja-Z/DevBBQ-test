$(document).on('ready', function(){
  $('#messages').hide();
  $('#switch-btn').on('click', function(){
    $('#messages').toggle();
  });
});