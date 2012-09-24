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
    path[0].onmouseover = (e)->
      path.attr {fill: config.selectedColor}
      R.safari()
      if config.onMouseOver
        config.onMouseOver province, e, path
    path[0].onmouseout = (e)->
      path.animate {fill: config.fillColor}, config.animationDuration || 500
      R.safari()
      if config.onMouseOut
        config.onMouseOut province, e, path
    if config.onClick
      path[0].onclick = (e)->
        config.onClick province, e, path

  # Draw Map and add mouse listeners
  load(province) for province in spainMap

  # Precalculated full map bounding box for performance purposes
  mapBBox =
    x: 150.522
    y: 11.305
    width: 416.74600000000004
    height: 348.17

  R.setViewBox mapBBox.x, mapBBox.y, mapBBox.width, mapBBox.height, true

  spainMap = null