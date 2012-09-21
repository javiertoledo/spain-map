# Defined on window scope to be available from outside
window.SpainMap = (config)->
  R = Raphael(config.id, config.width, config.height)

  attr =
    "fill": config.fillColor || "#d3d3d3"
    "stroke": config.strokeColor || "#fff"
    "stroke-width": config.strokeWidth || "0.75"

  load = (province) ->
    path = R.path(province.path).attr(attr)
    delete province.path
    path[0].style.cursor = "pointer"
    path[0].onmouseover = ->
      path.attr {fill: config.selectedColor}
      R.safari()
      if config.onMouseOver
        config.onMouseOver province
    path[0].onmouseout = ->
      path.animate {fill: config.fillColor}, config.animationDuration || 500
      R.safari()
    if config.onClick
      path[0].onclick = ->
        config.onClick province

  # Draw Map and add mouse listeners
  R.setStart()
  load(province) for province in spainMap
  set = R.setFinish()

  globalBBox = set.getBBox(true)
  R.setViewBox globalBBox.x, globalBBox.y, globalBBox.width, globalBBox.height, true

  spainMap = null