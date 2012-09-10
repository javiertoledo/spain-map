# Defined on window scope to be available from outside
class window.SpainMap
  constructor: (id, w, h)->
    R = Raphael(id.split('#')[1], w, h)
    attr =
      "fill": "#d3d3d3"
      "stroke": "#fff"
      "stroke-opacity": "1"
      "stroke-linejoin": "round"
      "stroke-miterlimit": "4"
      "stroke-width": "0.75"
      "stroke-dasharray": "none"
    usRaphael = {}

    # Draw Map and store Raphael paths
    for code, path of spainMap
      usRaphael[code] = R.path(path).attr(attr);


    # Do Work on Map
    for code, path of usRaphael
      path.color = Raphael.getColor();

      processState = (st, state) ->

        st[0].style.cursor = "pointer"

        st[0].onmouseover = ->
          st.animate {fill: st.color}, 500
          st.toFront()
          R.safari()

        st[0].onmouseout = ->
          st.animate {fill: "#d3d3d3"}, 500
          st.toFront()
          R.safari()

        st[0].onclick = ->
          alert("Has pulsado sobre #{state.substr(3).replace('_',' ')}!")

      processState(path, code)