# Analytics-importacion-R-
Scripts para trabajar con Analytics desde R 
Links de paginas donde hay mas info para leer: 


<b>En la parte que se llama Get the data! Está la explicación de cada parametro para realizar la Query.</b> 
https://www.bounteous.com/insights/2015/11/23/export-google-analytics-data-with-r/

<b>Explicacion de parámetros</b> : 
- batch: This is automatically set to TRUE. The batch parameter allows you to get around Google’s limit of pulling 10,000 observations per pull.

- walk: Setting this to TRUE will allow you to avoid sampling by pulling you Google Analytics data by increments of 1 day. Only use this functionality if it is need though, as using the walk attribute will query the API many times, increasing the time it takes to pull the data as well as using up your API quota. Additionally, if you data is still sampled on the one day level, this functionality will not completely eliminate sampling.

- start.date: Start date for your data export. This should be formatted as as.Date("YYYY-MM-DD"), for example, as.Date("2015-07-01").

- end.date: End date for your data export. This should be formatted as as.Date("YYYY-MM-DD"), for example, as.Date("2015-07-01").

- metrics: A list of the metrics that you wish to pull. You can have up to 10 metrics.

- dimensions: A list of the dimensions that you wish to pull. You can have up to 7 dimensions.

- sort: (optional) Sort the data by a specific dimension or metric

- filters: (optional) Add filters to your data.

- segment: (optional) Pull data from a specific segment. This can be either a segment already created in Google Analytics, or you can create it here.

- start: (optional) Pull data starting from this row of data

- max: (optional) maximum number of results to return

<b>Para saber como se llaman las metricas y dimensiones</b>: 
https://developers.google.com/analytics/devguides/reporting/core/dimsmets

<b>Para saber como hacer los filtros con "igual", "mayor que", "contiene", etc</b>. 
https://developers.google.com/analytics/devguides/reporting/core/v3/reference#filters

<b>En el caso de trabajar con fechas se recomienda el paquete: "Lubridate"</b>
Trabajar con fechas puede ser un poco tedioso con R porque a priori no entiende que se trata de una fecha por lo que las operaciones no las hace bien o ni siquiera permite que se realicen. Para eso leer este link: 
https://r4ds.had.co.nz/dates-and-times.html

También se pueden ver las funciones más importantes en este pdf: 
https://resources.rstudio.com/the-essentials-of-data-science/lubridate-cheat-sheet
