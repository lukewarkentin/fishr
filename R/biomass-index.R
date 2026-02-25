#' Calculate biomass index
#'
#'
#'
#' @param cpue Numeric vector of CPUE values
#' @param area_swept Numeric vector of area swept ( e.g., km^2)
#' @param catch Numeric
#' @param effort Numeric
#' @param ... arguments passed to CPUE
#'
#' @returns A numeric vector of biomass index values
#' @export
#'
#' @examples
#' salmon_cpue <- cpue(catch = 2, effort =2 )
#' biomass_index( salmon_cpue, 3)
biomass_index <- function(
  cpue = NULL,
  area_swept,
  catch = NULL,
  effort = NULL,
  ...
) {
  rlang::check_dots_used()

  if (is.null(cpue) && (!is.null(catch) && !is.null(effort))) {
    cpue <- cpue(catch, effort, ...)
  }
  cpue * area_swept
}
