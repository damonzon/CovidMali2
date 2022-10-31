#' @title Covid in Mali
#' @description Up-to-data cases
#' @export
#' @examples
#' CASES


library(ggplot2)
library(plotly)
library(dplyr)


Cases <- ggplot(Mali2, aes(x = Day,y=Cases)) +
  geom_line(aes(color="orange"),size=2) +
  ggtitle("COVID-19 Cumulative Cases in Mali")+
  theme(plot.title = element_text(size = 20))+
  #xlab("Days Since First Cases Confirmed" )+
  ylab("Cases")+
  #legend.position ="none" +
  #theme_clean() +
  theme(plot.background = element_rect(fill = '#d2d8d8', colour = 'black'))
Cases <- ggplotly(Cases)
Cases
