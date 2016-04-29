// Generated by CoffeeScript 1.10.0
var blocks;

blocks = [];

$(document).on("ready", function() {
  var block, i, len;
  blocks.push(new TetriminoBlockElement("testBlock01", 0, 0));
  blocks.push(new TetriminoBlockElement("testBlock02", 30, 0));
  blocks.push(new TetriminoBlockElement("testBlock03", 30, 30));
  blocks.push(new TetriminoBlockElement("testBlock04", 30, 60));
  for (i = 0, len = blocks.length; i < len; i++) {
    block = blocks[i];
    console.log(block + ": " + block.pointLeft);
  }
});

$(window).on("keydown", function(e) {
  var block, i, j, k, len, len1, len2, results, results1, results2;
  if (e.keyCode === 40) {
    results = [];
    for (i = 0, len = blocks.length; i < len; i++) {
      block = blocks[i];
      results.push(block.move(30, 0));
    }
    return results;
  } else if (e.keyCode === 39) {
    results1 = [];
    for (j = 0, len1 = blocks.length; j < len1; j++) {
      block = blocks[j];
      results1.push(block.move(0, 30));
    }
    return results1;
  } else if (e.keyCode === 37) {
    results2 = [];
    for (k = 0, len2 = blocks.length; k < len2; k++) {
      block = blocks[k];
      results2.push(block.move(0, -30));
    }
    return results2;
  }
});
