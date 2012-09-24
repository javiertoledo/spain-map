# Mapa interactivo de España
Mapa vectorial de España interactivo creado a partir de un mapa SVG y la librería RaphaëlJs.

## Demo

[Demo](http://mapasvgtest.theagilemonkeys.com)

## Uso

El mapa está preparado para integrarlo en cualquier página web ya que está contenido en un único fichero JavaScript minificado: spain-map.min.js

El mapa depende de la librería [RaphaëlJs](http://raphaeljs.com)

1. Carga raphaeljs y el script spain-map.js

  ```
  <script type="text/javascript" src="some/path/raphael-min.js"></script>
  <script type="text/javascript" src="some/path/spain-map.min.js"></script>
  ```

2. Crea una instancia de mapa. El mapa acepta los siguientes parámetros de configuración:

  ```
  <script type="text/javascript">
      new SpainMap({
        id: 'map', //(Requerido) Elemento HTML en el que se renderizará el mapa
        width: 700, //(Requerido) Ancho del mapa
        height: 400, //(Requerido) Alto del mapa
        fillColor: "#eeeeee", // color de relleno del mapa
        strokeColor: "#bbbbbb", // color de las líneas de frontera
        strokeWidth: 0.7, // ancho de las líneas de frontera
        selectedColor: "#99eeee", // color de relleno de la provincia al pasar el ratón por encima
        animationDuration: 200, // Duración de la animación de salida
        onClick: function(province, mouseevent) {
          // Método que se ejecutará al hacer click sobre una provincia
        },
        onMouseOver: function(province, mouseevent) {
          // Método que se ejecutará al pasar el ratón sobre una provincia
        },
        onMouseOut: function(province, mouseevent) {
          // Método que se ejecutará al salir de una provincia
        }
      });
  </script>
  ```

  ...

  ```
  <div id="map"></div>
  ```

## Fuentes
- [Mapa SVG de España](http://commons.wikimedia.org/wiki/File:Andaluc%C3%ADa_Oriental_con_M%C3%A1laga.svg)

- [RaphaëlJs](http://raphaeljs.com)

- Obtuve tips muy útiles de las siguientes fuentes:

  - [us-map-raphael](https://github.com/robflaherty/us-map-raphael)
  - [Marcin Dziewulski's Blog Post](http://playground.mobily.pl/tutorials/building-an-interactive-map-with-raphael.html)

## Generación de Paths a partir del fichero SVG
He creado un pequeño script ruby que procesa el mapa SVG para generar los paths de entrada de Raphaël. Es posible que funcione también con otros mapas que no estén agrupados, así que podría ser una buena base para desarrollar mapas de otras regiones.

El script se encuentra en `/utils/jsonify.rb` y su uso sería el siguiente presuponiendo que exista un fichero con nombre `input.svg` en el mismo directorio:

```
cd utils
ruby jsonize.rb > spain-map.coffee
```
Existen también servicios web que realizan conversiones a partir de SVGs más complejos como:
[Ready Set Raphael](http://readysetraphael.com)
[SVG2RaphaelJs](http://toki-woki.net/p/SVG2RaphaelJS/)
