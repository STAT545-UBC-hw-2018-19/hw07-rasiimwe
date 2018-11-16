#' nplots_violin
#' : Generate violin plots using ggplot2
#'
#' This function takes your plot arguments like the data, aesthetics, plot layers and labels and creates a violin plot for you using ggplot2. You don't have to worry about writing a bunch of lines of code. This function takes care ofthat for you!
#'
#' @param x The dataset to be used
#' @param y_variable y-axis variable for the  violin plot
#' @param factor the factor variable to be used in the violin plot
#' @param jitter argument to specify whether jitter should be included in plot - supply arguments TRUE of FALSE
#' @param order argument to specify whether factor reorder should be applied to a plot - supply arguments TRUE of FALSE
#' @param xlab argument to specify x axis label
#' @param ylab argument to specify y axis label
#' @param title argument to specify the plot title to be applied
#' @param plotly argument to specify whether the genereated plot should be rendered as a plotly plot
#' @param alpha argument to specify geom_poin opacity or transparency magnitude
#' @param hjust argument to specify horizontal justification of the plot title
#' @return violin plot
#' @details
#' This function takes plot the specified plot arguments and produces a violin plot using - \code{\link{nplots_violin}} with the background machinery being ggplot2. Future versions of this function will provide an inclusion of other plot layers and objects to work with.
#' @examples
#' \code {nplots_violin(gapminder, gapminder$gdpPercap, gapminder$continent, jitter=TRUE, order=TRUE, xlab="Continent", ylab="gdpPercap", title="gdpPercap across continents", plotly=TRUE, alpha=0.05, hjust=0.5)}
#' \code {nplots_violin(iris, iris$Sepal.Width, iris$Species, jitter=FALSE, order=TRUE, xlab="Sepal.Width", ylab="Sepal.Length", title="Sepal Width Vs Length", plotly=FALSE)}
#' @rdname nplots_violin
#' @import gapminder
#' @import ggplot2
#' @import magrittr
#' @import plotly
#' @import tidyverse
#' @export


nplots_violin <- function(x, y_variable, factor, jitter=TRUE, order=TRUE, xlab="", ylab="", title="", plotly=TRUE, alpha=0.05, hjust=0.5){

  if (!requireNamespace("ggplot2", "plotly", "gapminder", "tidyverse", quietly = FALSE)) {
    stop("Package \"pkg\" needed for this function to work. Please install it.",
         call. = FALSE)}

    if(plotly == TRUE){
      violin_plot <- x %>%
        ggplot2::ggplot(aes(reorder(factor, y_variable),y_variable)) +
        geom_violin() +
        theme_bw() +
        geom_jitter(alpha = alpha) +
        ggtitle(title) +
        theme(plot.title = element_text(hjust = hjust)) +
        labs(x = xlab, y = ylab)
      violin_plot2 <- plotly::ggplotly(violin_plot)
      return(violin_plot2)

    }
    else if (plotly == FALSE){
      violin_plot <- x %>%
        ggplot(aes(reorder(factor, y_variable),y_variable)) +
        geom_violin() +
        theme_bw() +
        geom_jitter(alpha=alpha) +
        ggtitle(title) +
        theme(plot.title = element_text(hjust = hjust)) +
        labs(x = xlab, y = ylab)
      return(violin_plot)
    }


  else print ("sorry, I can't provide the plot you specified - please check the plot arguments supplied")
}

