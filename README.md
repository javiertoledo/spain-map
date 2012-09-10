# Mapa interactivo de España
Mapa vectorial creado a partir de un fichero SVG de WikiMedia Commons y la librería RaphaëlJs para el renderizado y el manejo de eventos.

## Uso

El mapa está preparado para integrarlo en cualquier página web ya que está contenido en un único fichero JavaScript: interactive-spain-map.js

1. Carga el código del mapa

  ```
  <script type="text/javascript" src="some/path/interactive-spain-map.js"></script>
  ```

2. Crea una instancia de mapa sobre el elemento HTML de tu elección a partir de su ID

  ```
  <script type="text/javascript">
      new SpainMap('#map');
  </script>
  ```

  ...

  ```
  <div id="map"></div>
  ```

## Fuentes
- [Mapa SVG de España](http://commons.wikimedia.org/wiki/File:Andaluc%C3%ADa_Oriental_con_M%C3%A1laga.svg)

- [RaphaëlJs](http://raphaeljs.com)

- Obtuve pistas muy útiles de:

  - [us-map-raphael](https://github.com/robflaherty/us-map-raphael)
  - [Marcin Dziewulski's Blog Post](http://playground.mobily.pl/tutorials/building-an-interactive-map-with-raphael.html)

## Extra
He creado un pequeño script ruby que procesa el mapa SVG para generar los paths de entrada de Raphaël. Es posible que funcione también con otros mapas que no estén agrupados, así que podría ser una buena base para desarrollar mapas de otras regiones.

El script se encuentra en `/utils/jsonify.rb` y su uso sería el siguiente presuponiendo que exista un fichero con nombre `input.svg` en el mismo directorio:

```
cd utils
ruby jsonize.rb > ../src/spain-map.coffee
```
