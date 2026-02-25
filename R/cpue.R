#' Calculate catch per unit effort (CPUE)
#'
#'
#'
#' @param catch Numeric vector of catch
#' @param effort Numeric vector of effort
#' @param gear_factor Numeric vector for gear standardize
#' @param verbose Logical, if TRUE, prints messaging. Default is FALSE
#'
#' @returns Numeric vector of CPUE values
#' @export
#'
#' @examples
#' cpue(100,10)
#' cpue(100,10, gear_factor = 1.5)
cpue <- function(
  catch,
  effort,
  gear_factor = 1,
  verbose = getOption("fishr.verbose", default = FALSE)
) {
  if (verbose) {
    message("Processing ", length(catch), " records.")
  }

  raw_cpue <- catch / effort

  raw_cpue * gear_factor
}
