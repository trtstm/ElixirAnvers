'use strict';

window.addEventListener("load", function(event) {
  var handleClick = function(target) {
    return function(e) {
      e.preventDefault();

      target.submit();
    };
  };

  var elems = document.getElementsByClassName("anvers-submit-target");
  for(var i = 0; i < elems.length; i++) {
    var target = elems[i].getAttribute('data-submit-target');
    if(target === null) {
      continue;
    }

    target = document.getElementById(target);
    if(target === null) {
      continue;
    }

    elems[i].addEventListener("click", handleClick(target));
  }
});
