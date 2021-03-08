function Request() {
  this.type = '';
  this.url = '';
  this.data = {};
  this.dataType = 'json';
  this.success = function(response){
  }
  this.error = function(response){
  }
};

function postUser(successCB, errorCB) {
  var newRequest = new Request();
  newRequest['type'] = 'POST';
  newRequest['url'] = 'users';
  newRequest['xhrFields'] = { 'withCredentials': true };
  newRequest['success'] = function(response){
    return successCB(response);
  };
  newRequest['error'] = function(request, errorMsg){
    return errorCB(request, errorMsg);
  };

  $.ajax(newRequest);
};


$(".homepage.index").ready(function(){
  if (document.querySelectorAll(".homepage.index").length) {
    $('#create-user').click(function () {
      postUser(function(response) {
        console.log(response);
        $('#user-response').text(JSON.stringify(response).replace(/"/g, ''));
      }, function(request, errorMsg) {
        console.error(errorMsg);
      });
    });
  }
});
