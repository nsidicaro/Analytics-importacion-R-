# Analytics-importacion-R-
Scripts para trabajar con Analytics desde R 

<b>Para descargar los metadatos (con esto me refiero a informacion sobre la cuenta, objetivos, filtros, segmentos, etc.)</b>

Si bien el código es bastante intuitivo hago un par de aclaraciones: 
- Donde dice XXXXXXX no es un link a páginas para adultes, sino que ahí hay que poner el AccountID, propertyID y viewID, en ese orden. 
- Estos datos si bien están en Analytics (al hacer click en la eleccion de la vista figuran unos números bajo el nombre de la vista) se pueden obtener con la primera parte del codigoo.
- Si ven que es muy paja agregarlos a cada lugar que quieren poner eso solo tienen que agregar en el código, al principio, lo siguiente: 
accountID <- "XXXXXXXXXXX"
propertyID <- "XXXXXXXXXXX"
viewID <- "XXXXXXXXX" 
De vuelta, ahí van los números que se obtienen con el primer código. 

<b> El paquete googleAnalyticsR </b> 
Es un paquete bastante extenso que tiene muchas opciones, de hecho se puede sacar información también con este paquete, por lo que dejo un par de links para orientarse en el caso de que no entiendan algo. 

Pagina principal del paquete: 
http://code.markedmondson.me/googleAnalyticsR/

Algunas funciones que pueden usarse: 
http://code.markedmondson.me/googleAnalyticsR/news/index.html#googleanalyticsr-0-6-0

Varios ejemplos de lo que puede hacerse con el paquete: 
https://cran.r-project.org/web/packages/googleAnalyticsR/vignettes/googleAnalyticsR.html
https://code.markedmondson.me/googleAnalyticsR/articles/v4.html

Algunos tutoriales para hacer cosas piolas: 
https://code.markedmondson.me/googleAnalyticsR/#tutorials

<iframe src="https://giphy.com/embed/jUwpNzg9IcyrK" width="480" height="360" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/the-simpsons-scared-homer-simpson-jUwpNzg9IcyrK">via GIPHY</a></p>
