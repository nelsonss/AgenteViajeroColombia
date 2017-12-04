Esta es una aplicación Shiny para resolver el problema de agente viajero usando el algoritmos Recocido Simulado (Simulated Annealing).
Agradecimientos a http://toddwschneider.com

El programa ha sido adaptado para recorrer las ciudades de Colombia

La información de coordenadas geográficas es aproximada y ha sido tomada visitando virtualmente cada ciudad y
tomando los datos desde Google Maps.

Los datos del total de población han sido tomados de wikipedia.

Este programa ha sido adaptado con propósitos académicos por:

Rafael Ignacio Hernandez

Nelson Sánchez Sánchez

Para ejecutar la aplicación en su máquina local, use las siguientes instrucciones en la consola de R:

```R
install.packages(c("shiny", "maps", "geosphere"), repos="http://cran.rstudio.com/")
library(shiny)
runGitHub("AgenteViajeroColombia", "nelsonss")
```

![](http://images.rapgenius.com/0e1ca854cbc30f33abc46108f2ba38f2.640x640x42.gif)
