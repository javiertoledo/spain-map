# Defined on window scope to be available from outside
window.SpainMap = (config)->
  R = Raphael(config.id, config.width, config.height)

  config.animate = true unless config.animate == false

  attr =
    "fill": config.fillColor || "#d3d3d3"
    "stroke": config.strokeColor || "#fff"
    "stroke-opacity": "1"
    "stroke-linejoin": "round"
    "stroke-miterlimit": "4"
    "stroke-width": config.strokeWidth || "0.75"
    "stroke-dasharray": "none"

  globalBBox =
    x: config.width
    y: config.height
    x2: 0
    y2: 0

  expandBBox = (bbox) ->
    globalBBox.x = bbox.x if globalBBox.x > bbox.x
    globalBBox.y = bbox.y if globalBBox.y > bbox.y
    globalBBox.x2 = bbox.x2 if globalBBox.x2 < bbox.x2
    globalBBox.y2 = bbox.y2 if globalBBox.y2 < bbox.y2

  load = (province) ->
    path = R.path(province.path).attr(attr)
    expandBBox path.getBBox()
    path[0].style.cursor = "pointer"
    path[0].onmouseover = ->
      if config.animate
        path.animate {fill: config.selectedColor}, config.animationDuration || 500
      else
        path.attr {fill: config.selectedColor}
      R.safari()
      if config.onMouseOver
        config.onMouseOver province
    path[0].onmouseout = ->
      if config.animate
        path.animate {fill: config.fillColor}, config.animationDuration || 500
      else
        path.attr {fill: config.fillColor}
      R.safari()
    if config.onClick
      path[0].onclick = ->
        config.onClick province

  # Draw Map and add mouse listeners
  load(province) for province in spainMap

  spainMap = null

  globalBBox.width = globalBBox.x2-globalBBox.x
  globalBBox.height = globalBBox.y2-globalBBox.y
  R.setViewBox globalBBox.x, globalBBox.y, globalBBox.width, globalBBox.height, true