
install.packages ("readr") ## Instalar librería con la funcion para cargar un archivo tsv
library (readr) ## Cargar libreria 

tabla <- read_tsv (file = "ExperimentoDesconocido.top.table.tsv") ## Cargar archivo
View (tabla) ## Ver la tabla

library (viridis) ## Por si acaso, hehe

boxplot (tabla$logFC, col =  "slateblue") ## Boxplot del log FC de la lista de genes

sub <- (which (tabla$logFC > 0)) ## Sondas con un logFC menor a 0 (subexpresadas)
sub ## 7276

sobre <- (which (tabla$logFC < 0)) ## Sondas con un logFC mayor a 0 (sobreexpresadas)
sobre ## 13007

## Se que estoy siendo un poco laxo con los valores, pero cuando vi la tabla, vi que muchos genes tenian un logFC mayor a 1, asi que los quise incluir de esa manera
## Con el valor de p se me ocurrio que podria ser igualmente, pero despues me di cuenta de que era un poco impractico


help(plot)

plot (x = tabla$logFC, y = -log10 (tabla$P.Value)) ## Volcano plot primitivo con el logFC de las sondas en X, Y significa el -log del valor de P (esto permite visualizar cuan significativo es la expresion de los genes)

library (limma) ## Cargar libreria para hacer un analisis de GO

BiocManager::install("GO.db") ## Instalar libreria GO.db


genes <- tabla ## Es lo mismo, pero le quise cambiar el nombre

GO <- goana (genes) ## Analisis de GO para los genes de la tabla
GO

## Me quede sin tiempo, la verdad, no pude terminar de cargar todo, pero bueno :c mi PC es dem
