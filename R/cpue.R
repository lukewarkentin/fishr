#' Calculate catch per unit effort (CPUE)
#'
#'
#'
#' @param catch  Numeric vector of catch, or data.frame with "catch" and "effort" columns
#' @param ... Additional arguments passed on to methods
#'
#' @export
cpue <- function(catch, ...) {
  UseMethod("cpue")
}


#' @rdname cpue
#' @param effort Numeric vector of effort
#' @param gear_factor Numeric vector for gear standardize
#' @param method Character; one of "ratio" or "log".
#' @param verbose Logical, if TRUE, prints messaging. Default is FALSE
#' @param ...
#'
#' @returns Numeric vector of CPUE values
#' @export
#'
#' @examples
#' cpue(100,10)
#' cpue(100,10, gear_factor = 1.5)
cpue.numeric <- function(
  catch,
  effort,
  gear_factor = 1,
  method = c("ratio", "log"),
  verbose = getOption("fishr.verbose", default = FALSE),
  ...
) {
  validate_numeric_inputs(catch = catch, effort = effort)
  if (verbose) {
    message("Processing ", length(catch), " records.")
  }

  method <- match.arg(method)

  raw_cpue <- switch(method, ratio = catch / effort, log = log(catch / effort))
  result <- new_cpue_result(
    values = raw_cpue * gear_factor,
    method = method,
    gear_factor = gear_factor,
    n_records = length(catch)
  )

  result
}


#' @rdname cpue
#' @export
cpue.data.frame <- function(
  catch,
  gear_factor = 1,
  method = c("ratio", "log"),
  verbose = getOption("fishr.verbose", FALSE),
  ...
) {
  if (!"catch" %in% names(catch)) {
    stop("Column 'catch' not found in data frame.", call. = FALSE)
  }
  if (!"effort" %in% names(catch)) {
    stop("Column 'effort' not found in data frame.", call. = FALSE)
  }

  # We can then call the numeric method by extracting the relevant columns and passing them to cpue() again.
  # This way we reuse the existing logic and maintain a single source of truth for the CPUE calculation.
  cpue(
    catch = catch[["catch"]],
    effort = catch[["effort"]],
    gear_factor = gear_factor,
    method = method,
    verbose = verbose,
    ...
  )
}


#' @rdname cpue
#' @export
cpue.default <- function(catch, ...) {
  stop("Unsupported input type for cpue(): ", class(catch), call. = FALSE)
}

#' @export
print.cpue_result <- function(x, ...) {
  cat("Survey Result Summary\n")
  cat("---------------------\n")
  cat("Method: ", attr(x, "method"), "\n")
  cat("Gear factor: ", attr(x, "gear_factor"), "\n")
  cat("Records", attr(x, "n_records"), "\n") # cat() prints text to the console
  cat("Mean CPUE: ", round(mean(x), 2), "\n")
  cat("SD CPUE: ", round(stats::sd(x), 2), "\n")
  invisible(x) # this is so you can still assign things to the result
}


# Constructor function: add attributes to the result
new_cpue_result <- function(values, method, gear_factor, n_records) {
  structure(
    # way to add attributes to an object
    values,
    method = method,
    gear_factor = gear_factor,
    n_records = n_records,
    class = "cpue_result"
  )
}
