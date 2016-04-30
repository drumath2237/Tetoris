// Generated by CoffeeScript 1.10.0
var TetriminoRed, idNumber;

idNumber = 0;

TetriminoRed = (function() {
  function TetriminoRed() {
    this.point = {
      top: 0,
      left: 0
    };
    this.blocks = [new TetriminoBlockElement("block" + (idNumber++), 0, 0), new TetriminoBlockElement("block" + (idNumber++), 30, 0), new TetriminoBlockElement("block" + (idNumber++), 30, 30), new TetriminoBlockElement("block" + (idNumber++), 30, 60)];
  }

  TetriminoRed.prototype.move = function(deltaPointTop, deltaPointLeft) {
    var block, i, len, ref, results;
    this.point.top += deltaPointTop;
    this.point.left += deltaPointLeft;
    ref = this.blocks;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      block = ref[i];
      results.push(block.move(deltaPointTop, deltaPointLeft));
    }
    return results;
  };

  return TetriminoRed;

})();
