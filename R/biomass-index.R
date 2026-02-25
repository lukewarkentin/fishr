#' Calculate biomass index
#'
#' See [cpue()] for more details.
#'
#' @param cpue Numeric vector of CPUE values
#' @param area_swept Numeric vector of area swept ( e.g., km^2)
#' @param verbose Logical, if TRUE, prints messaging. Default is FALSE
#' @inheritParams cpue
#' @inheritDotParams cpue
#'
#' @returns A numeric vector of biomass index values
#' @export
#'
#' @details
#' Two modes of use:
#'
#' - Provide `cpue` directly for a simple calculation.
#' - Provide `catch` and `effort` to compute CPUE first, then scale by area.
#'
#' @seealso See [cpue()] or [CPUE function][cpue()]
#'
#' @examples
#' salmon_cpue <- cpue(catch = 2, effort =2 )
#' biomass_index( salmon_cpue, 3)
biomass_index <- function(
  cpue = NULL,
  area_swept,
  catch = NULL,
  effort = NULL,
  verbose = getOption("fishr.verbose", default = FALSE),
  ...
) {
  rlang::check_dots_used()

  length_used <- ifelse(is.null(cpue), length(catch), length(cpue))

  if (verbose) {
    message("Processing ", length_used, " records.")
  }

  if (is.null(cpue) && (!is.null(catch) && !is.null(effort))) {
    cpue <- cpue(catch, effort, ...)
  }

  cpue * area_swept
}
