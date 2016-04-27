// Generated by CoffeeScript 1.10.0
// (function() {
  var move;

  move = function(direction, minus) {
    var fun;
    if (direction == null) {
      direction = "top";
    }
    if (minus == null) {
      minus = 1;
    }
    $('.falling_red').each(fun = function() {
      var blockCSS;
      blockCSS = parseInt($(this).css("" + direction).slice(0, -2));
      if (minus === 1) {
        if (blockCSS + 60 < 600) { //TODO:横と縦のサイからあたり判定→クラスメンバに登録
          blockCSS += 30;
        }
      } else {
        if (blockCSS > 0) {
          blockCSS -= 30;
        }
      }
      console.log(blockCSS);
      $(this).css("" + direction, blockCSS);
    });
  };

  $(window).on("keydown", function(e) {
    switch (e.keyCode) {
      case 40:
        return move();
      case 39:
        return move("left", 1);
      case 37:
        return move("left", -1);
      case 32:
        return setInterval("move()", 1000);
    }
  });

// }).call(this);
