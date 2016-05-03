idNumber = 0

class Tetrimino

  constructor: (locate, type) ->
    @type = type
    @point =
      top: 0
      left: 0
    @blocks = [
      new TetriminoBlockElement("block#{idNumber++}", locate[0], locate[1], type),
      new TetriminoBlockElement("block#{idNumber++}", locate[2], locate[3], type),
      new TetriminoBlockElement("block#{idNumber++}", locate[4], locate[5], type),
      new TetriminoBlockElement("block#{idNumber++}", locate[6], locate[7], type),
    ]
    @deg =
      "deg0": locate
      "deg90": [0,0,0,0,0,0,0,0]
      "deg180": [0,0,0,0,0,0,0,0]
      "deg270": [0,0,0,0,0,0,0,0]

  move: (deltaPointTop, deltaPointLeft) ->
    if deltaPointTop isnt 0
      for block in @blocks
        if block.judgeBottom() is off
          for block_ in @blocks
            block_.changeAttr()
          return false
    if deltaPointLeft > 0
      for block in @blocks
        if block.judgeRight() is off
          return false
    if deltaPointLeft < 0
      for block in @blocks
        if block.judgeLeft() is off
          return false

    @point.top += deltaPointTop
    @point.left += deltaPointLeft
    for block in @blocks
      block.move(deltaPointTop, deltaPointLeft)

    return true

  rotate: (deg) ->
    for block, i in @blocks
      block.moveAbsolute(
        @point.top + @deg["deg#{deg}"][i*2],
        @point.left + @deg["deg#{deg}"][i*2+1]
        )

class TetriminoRed extends Tetrimino
  constructor: () ->
    super([
      0, 0
      30, 0
      30, 30
      30, 60
      ], "red")
    @deg["deg90"]=[
      0, 30
      0, 60
      30, 30
      60, 30
    ]
    @deg["deg180"]=[
      30,0
      30, 30
      30, 60
      60, 60
    ]
    @deg["deg270"]=[
      0, 30
      30, 30
      60, 0
      60, 30
    ]

class TetriminoYellow extends Tetrimino
  constructor: (args) ->
    super([
      0, 0
      0, 30
      30, 0
      30, 30
      ], "yellow")
    @deg["deg90"]=[
      0, 0
      0, 30
      30, 0
      30, 30
    ]
    @deg["deg180"]=[
      0, 0
      0, 30
      30, 0
      30, 30
    ]
    @deg["deg270"]=[
      0, 0
      0, 30
      30, 0
      30, 30
    ]
