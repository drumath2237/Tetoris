class TetriminoBlockElement

  constructor: (name, pTop=0, pLeft=0, color="red") ->
    @pointTop = pTop
    @pointLeft = pLeft
    @myName = name
    @type = color
    @me = "##{@myName}"

    @append()
    @move(@pointTop, @pointLeft)

  append: () ->
    $("#field").append("<div class='falling_#{@type}' id='#{@myName}'></div>")
    return

  move: (deltaPointTop=0, deltaPointLeft=0) ->
    pointTop = @getTop(@me)
    pointLeft = @getLeft(@me)

    $(@me).css("top", pointTop + deltaPointTop)
    $(@me).css("left", pointLeft + deltaPointLeft)
    return

  moveAbsolute: (top, left) ->
    $(@me).css("top", top)
    $(@me).css("left", left)
    return

  getTop: (selector, property="top") ->
    parseInt($(selector).css("top").slice(0, -2))

  getLeft: (selector, property="left") ->
    parseInt($(selector).css("left").slice(0, -2))

  delete: () ->
    $(@me).remove()

  judgeRight: () ->
    pro = @getLeft(@me) + 30
    if pro >= 600
      return false
    else
      return true

  judgeLeft: () ->
    pro = @getLeft(@me) - 30
    if pro < 0
      return false
    else
      return true

  judgeBottom: () ->
    pro = @getTop(@me) + 30
    if pro >= 600
      return false
    else
      return true

  changeAttr: () ->
    # $(@me).attr("class", "falled")
    $(@me).removeAttr("id")

  helloConsole = (str) ->
    console.log "hello from #{str}"
    return
