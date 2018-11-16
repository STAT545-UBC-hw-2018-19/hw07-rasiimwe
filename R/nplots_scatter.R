#' nplots_scatter
#' : Generate scatter plots using ggplot2
#'
#' This function takes your plot arguments like the data, aesthetics, plot labels, desired layers and creates a scatter plot for you using ggplot2. You don't have to worry about writing a bunch of lines of code. This function takes care ofthat for you!
#'
#' @param x The dataset to be used
#' @param x_variable x-axis variable for the scatter plot
#' @param y_variable y-axis variable for thescatter plot
#' @param xlab argument to specify x axis label
#' @param ylab argument to specify y axis label
#' @param title argument to specify the plot title to be applied
#' @param plotly argument to specify whether the genereated plot should be rendered as a plotly plot
#' @param alpha argument to specify geom_poin opacity or transparency magnitude
#' @param hjust argument to specify horizontal justification of the plot title
#' @return scatter plot
#' @details
#' This function takes plot the specified plot arguments and produces a scatter plot using - \code{\link{nplots_scatter}} with the background machinery being ggplot2. Future versions of this function will provide an inclusion of other plot layers and objects to work with.
#' @examples
#' \code {nplots_scatter(gapminder, gapminder$lifeExp, gapminder$gdpPercap, xlab="lifeExp", ylab="gdpPercap", title="lifeExp Vs GdpPercap", plotly=FALSE)}
#' \code {nplots_scatter(iris, iris$Sepal.Width, iris$Sepal.Length, xlab="Sepal.Width", ylab="Sepal.Length", title="Sepal Width Vs Length", plotly=FALSE)}
#' @rdname nplots_scatter
#' @import ggplot2
#' @import gapminder
#' @import magrittr
#' @import plotly
#' @import tidyverse
#' @export


nplots_scatter <- function(x, x_variable, y_variable, xlab="", ylab="", title="", plotly=TRUE, alpha=0.2, hjust=0.5){

  if (!requireNamespace("ggplot2", "plotly", "gapminder", "tidyverse", quietly = FALSE)) {
    stop("Package \"pkg\" needed for this function to work. Please install it.",
         call. = FALSE)}

  base <- x %>%
    ggplot(aes(x_variable, y_variable)) +
    scale_y_log10() +
    labs(x = xlab, y = ylab) +
    theme_bw() +
    ggtitle(title) +
    theme(plot.title = element_text(hjust = hjust))


    if (plotly == "TRUE"){
      scatter_plot <-  base +
        geom_point(alpha = alpha) +
        geom_smooth(method = lm)
      scatter_plot2 <- ggplotly(scatter_plot)
      return(scatter_plot2)
      }

    else if(plotly == "FALSE"){
      scatter_plot <-  base +
        geom_point(alpha = alpha) +
        geom_smooth(method = lm)
      return(scatter_plot)
      }


  else print ("sorry, I can't provide the plot you specified - please check the plot arguments supplied.")
}
