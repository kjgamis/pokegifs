document.addEventListener('DOMContentLoaded', function() {
  var submit = document.querySelector('.submit');
  submit.addEventListener('click', function(event) {
    event.preventDefault();
    console.log("okay");
    var pokemon = document.querySelector('#query').value;
     // window.location.href = "http://pokegifs.herokuapp.com/pokemon/" + pokemon;
     window.location.href = "http://localhost:3000/pokemon/" + pokemon;
  });
})
