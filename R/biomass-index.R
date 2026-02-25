#' Calculate biomass index
#'
#'
#'
#' @param cpue Numeric vector of CPUE values
#' @param area_swept Numeric vector of area swept ( e.g., km^2)
#'
#' @returns A numeric vector of biomass index values
#' @export
#'
#' @examples
#' salmon_cpue <- cpue(catch = 2, effort =2 )
#' biomass_index( salmon_cpue, 3)
biomass_index <- function(cpue, area_swept) {
  cpue * area_swept
}
