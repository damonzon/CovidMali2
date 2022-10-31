## code to prepare `DATASET` dataset goes here

library(dplyr)
library(tidyr)
data<- read.csv("https://raw.github.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv",
                header = FALSE, stringsAsFactors = FALSE)

ml <- dplyr::filter(data,V2 =="Mali")
ml <-ml[-c(1,3:4)]

Mali<-tidyr::gather(ml,key ="V2",value = "Cases")
names(Mali)[1] <- "Day"
Mali$Day <- seq(1,nrow(Mali),1)
Mali$Cases <- as.integer(as.character( Mali$Cases))
Mali2 <- dplyr::filter(Mali, Cases>0)
Mali2 <- Mali2[-c(1),]
Mali2$Day <- seq(1,nrow(Mali2),1)
row.names(Mali2) <- NULL

usethis::use_data(DATASET, overwrite = TRUE)
