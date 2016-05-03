blocks = []
test = 0
degValue = 0
re = true
timer = 0
$(document).on "ready", () ->
  test = new TetriminoRed
  timer = setInterval( (->
    re = test.move(30, 0)
    console.log "re: #{re}"
    if re is false
      clearInterval(timer)), 1000)

$(window).on "keydown", (e)->
  if test isnt "wait"
    if e.keyCode is 40
      test.move(30, 0)
      clearTimer()
    else if e.keyCode is 39
      test.move(0, 30)
      clearTimer()
    else if e.keyCode is 37
      test.move(0,-30)
      clearTimer()
    else if e.keyCode is 32
      if degValue < 270
        test.rotate(degValue+=90)
      else
        test.rotate(0)
        degValue = 0
      clearTimer()

clearTimer = () ->
  if re is false
    clearInterval(timer)
