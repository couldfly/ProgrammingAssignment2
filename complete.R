
## part 2 della week2
## @autor: cinzia
## @date : 31/03/2016

complete <- function(directory, id = 1:332) {
        ## directory: è un vettore di caratteti di 
        ## lunghezza 1 indicante la cartella dei file .csv
        
        ## id: è un vettore di interi indicante l'id number da usare
        
        ## Restituisce un data frame con la seguente forma:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## dove 'id' è l'ID number and 'nobs' è il numero di
        ## osservazioni
       
        
        ## setto al working directory
        if(grep("specdata", directory) == 1) {
                directory <- ("./specdata/")
        }
        
        # creo un data frame vuoto
        dati <- data.frame()
        # creo nbos vuoto
        nobs = 0

        # creo la lista dei file dalla directory(specdata nel nostro caso
        # in quando dentro la getwd() )
        file_list <- list.files(directory, full.names = TRUE)
        
        # per ogni file sulla base del'id indicato 
        # li metto uno sotto l'altro e sommo il numero di righe
        for(i in id){
                ## sommo il numero righe della selezione
                nobs <- sum(complete.cases(read.csv(file_list[i])))
                ##le inserisco in un dataframe vuoto
                tmp <- data.frame(i, nobs) 
                ## metto uno sotto l'altro i vari tmp
                dati <- rbind(dati, tmp)
        }
        
        colnames(dati) <- c("id", "nobs")
        dati
}

## @test
## > source("complete.r")
## > complete("specdata", 1)
## id nobs
## 1  1  117
## > complete("specdata", c(2, 4, 8, 10, 12))
## id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
## > complete("specdata", 30:25)
## id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
## > complete("specdata", 3)
## id nobs
## 1  3  243

