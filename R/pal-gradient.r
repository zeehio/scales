#' Arbitrary colour gradient palette (continous).
#' 
#' @export
gradient_n_pal <- function(colours, values = NULL, space = "Lab") {
  ramp <- colorRamp(colours, space = space)

  function(x) {
    if (!is.null(values)) {
      xs <- seq(0, 1, length = length(values))      
      f <- approxfun(values, xs)
      x <- f(x)
    }
    
    rgb(ramp(x), max = 255)
  }
}

#' Diverging colour gradient (continous).
#' 
#' @param low colour for low end of gradient.
#' @param mid colour for mid point
#' @param high colour for high end of gradient.
#' @param space colour space in which to calculate gradient.  "Lab" usually
#'   best unless gradient goes through white. 
#' @export
#' @examples
#' x <- seq(-1, 1, length = 100)
#' r <- sqrt(outer(x^2, x^2, "+"))
#' image(r, col = div_gradient_pal()(seq(0, 1, length = 12)))
#' image(r, col = div_gradient_pal()(seq(0, 1, length = 30)))
#' image(r, col = div_gradient_pal()(seq(0, 1, length = 100)))
#' image(r, col = div_gradient_pal(low = 
#'    mnsl(complement("10R 4/6", fix = T)))(seq(0, 1, length = 100)))
div_gradient_pal <- function(low = mnsl("10B 4/6"), mid = mnsl("N 8/0"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, mid, high), space = space)
}

#' Sequential colour gradient palette (continous).
#' 
#' @param low colour for low end of gradient.
#' @param high colour for high end of gradient.
#' @param space colour space in which to calculate gradient.  "Lab" usually
#'   best unless gradient goes through white. 
#' @export
seq_gradient_pal <- function(low = mnsl("10B 4/6"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, high), space = space)
}
