#' @title Get modified options for modelStudio
#'
#' @description This function returns default options for \code{modelStudio}.
#' It is possible to modify values of this list and pass it to \code{options}
#' parameter in the main function. \strong{WARNING: Editing default options may cause
#' unintended behaviour.}
#'
#' @param ... options to change, \code{option_name = value}.
#'
#' @return \code{list} of options for modelStudio
#'
#' \subsection{Main options:}{
#' \describe{
#' \item{scale_plot}{\code{TRUE} make every plot the same height, ignores \code{bar_width}}
#' \item{show_subtitle}{\code{TRUE} should subtitle be displayed?}
#' \item{subtitle}{\code{label} parameter from \code{explainer}}
#' \item{margin_*}{plot margins, change \code{margin_left} for longer/shorter axis labels}
#' \item{w}{\code{420} inner plot width}
#' \item{h}{\code{280} inner plot height}
#' \item{bar_width}{\code{16} in px, width of bars, default for all plots,
#' is ignored when \code{scale_plot == TRUE}}
#' \item{line_size}{\code{2} in px, width of lines, default for all plots}
#' \item{point_size}{\code{3} in px, point radius, default for all plots}
#' \item{[bar,line,point]_color}{\code{[#46bac2,#46bac2,#371ea3]}}
#' \item{positive_color}{\code{#8bdcbe} for Break Down and Shapley Values}
#' \item{negative_color}{\code{#f05a71} for Break Down and Shapley Values}
#' \item{default_color}{\code{#371ea3} for Break Down and highlighted line}
#' }
#' }
#' \subsection{Plot specific options:}{
#' \code{**} is a two letter code unique to each plot, might be
#' one of \code{[bd,sv,cp,fi,pd,ad,fd]}\cr
#'
#' \describe{
#' \item{**_title}{plot specific title}
#' \item{**_subtitle}{plot specific subtitle, default is \code{subtitle}}
#' \item{**_bar_width}{plot specific width of bars, default is \code{bar_width},
#' is ignored when \code{scale_plot == TRUE}}
#' \item{**_line_size}{plot specific width of lines, default is \code{line_size}}
#' \item{**_point_size}{plot specific point radius, default is \code{point_size}}
#' \item{**_*_color}{plot specific \code{[bar,line,point]} color, default is \code{[bar,line,point]_color}}
#' }
#' }
#'
#'
#' @examples
#' library("dime")
#'
#' apartments <- DALEX::apartments
#'
#' model_apartments <- glm(m2.price ~. ,
#'                         data = apartments)
#'
#' explain_apartments <- DALEX::explain(model_apartments,
#'                                      data = apartments[,-1],
#'                                      y = apartments[,1],
#'                                      verbose = FALSE)
#'
#' new_apartments <- apartments[1:2,]
#' rownames(new_apartments) <- c("ap1","ap2")
#'
#' op <- modelStudioOptions(
#'   show_subtitle = TRUE,
#'   bd_subtitle = "Hello World",
#'   line_size = 5,
#'   point_size = 9,
#'   line_color = "pink",
#'   point_color = "purple",
#'   bd_positive_color = "yellow",
#'   bd_negative_color = "orange"
#' )
#'
#' modelStudio(explain_apartments, new_apartments,
#'             facet_dim = c(1,2), N = 100, B = 15, show_info = FALSE,
#'             options = op)
#'
#' @export
#' @rdname modelStudioOptions
modelStudioOptions <- function(...) {

  # prepare default options
  default_options <- list(
    scale_plot = TRUE,
    show_subtitle = FALSE,
    subtitle = NULL,
    margin_top = 50,
    margin_right = 20,
    margin_bottom = 70,
    margin_left = 105,
    margin_inner = 40,
    margin_small = 5,
    margin_big = 10,
    w = 420,
    h = 280,
    bar_width = 16,
    line_size = 2,
    point_size = 3,
    bar_color = "#46bac2",
    line_color = "#46bac2",
    point_color = "#371ea3",
    positive_color = "#8bdcbe",
    negative_color = "#f05a71",
    default_color = "#371ea3",
    bd_title = "Break Down",
    bd_subtitle = NULL,
    bd_bar_width = NULL,
    bd_positive_color = NULL,
    bd_negative_color = NULL,
    bd_default_color = NULL,
    sv_title = "Shapley Values",
    sv_subtitle = NULL,
    sv_bar_width = NULL,
    sv_positive_color = NULL,
    sv_negative_color = NULL,
    sv_default_color = NULL,
    cp_title = "Ceteris Paribus",
    cp_subtitle = NULL,
    cp_bar_width = NULL,
    cp_line_size = NULL,
    cp_point_size = NULL,
    cp_bar_color = NULL,
    cp_line_color = NULL,
    cp_point_color = NULL,
    fi_title = "Feature Importance",
    fi_subtitle = NULL,
    fi_bar_width = NULL,
    fi_bar_color = NULL,
    pd_title = "Partial Dependency",
    pd_subtitle = NULL,
    pd_bar_width = NULL,
    pd_line_size = NULL,
    pd_bar_color = NULL,
    pd_line_color = NULL,
    ad_title = "Accumulated Dependency",
    ad_subtitle = NULL,
    ad_bar_width = NULL,
    ad_line_size = NULL,
    ad_bar_color = NULL,
    ad_line_color = NULL,
    fd_title = "Feature Distribution",
    fd_subtitle = NULL,
    fd_bar_width = NULL,
    fd_bar_color = NULL
  )

  # input user options
  default_options[names(list(...))] <- list(...)

  default_options
}