# Packaging Guide

https://devguide.ropensci.org/pkg_building.html

## Package name and metadata

### Package name: chopin
[x] clear, short, catchy
- I really link the name because it evokes chopping up spatial objects into chunks and -- music!

### Package metadata
[x] great to see codemetar already being used
- consider some of [these ways](https://github.com/ropensci/codemetar?tab=readme-ov-file#keep-codemetajson-up-to-date) to keep it up to date

## Platforms
[x] tests on Mac, Linux, Windows

## Package API

### Function and argument naming
[x] snake case
- `is_bbox_within_reference` uses `print()`. Consider using `message()` instead
TODO: check `is_bbox_within_reference` prints
TODO: object first arg for piping
TODO: check with conflicted

## Code Style
- consider running styler::style_pkg 
- pre commit hook https://styler.r-lib.org/articles/third-party-integrations.html

## Citation file
-  consider additing a CITATION file with `usethis::use_citation()`, see [here](https://devguide.ropensci.org/pkg_building.html#citation-file)

## README
[x] badges
[x] objective
- installation instructions could use details for installing dependencies
- avoid `#### Last edited: March 22, 2024` risk of being outdated, users can see last modification date on GitHub
- add citation information
- related packages
- possibly simplify the examples to show us a better hook of what {chopin} can do
    - reduce system time examples, maybe move to a benchmark vignette?
- add caveats section 
    - why is parallelization slower
    - comparing single thread vs multi thread calculations
    - turn off spherical geometry
- increase the font size in the diagram?
- no need to list devtools if listing remotes since devtools just wraps remotes
- remove install.packages() until {chopin} is on CRAN


## Documentation
### General

Missing example
- `extract_at` (reuse example see [roxygen2 vignette](https://roxygen2.r-lib.org/articles/reuse.html))

Examples not run with `if (FALSE)` or dontrun. Consider a smaller toy example?
- `par_grid`
- `par_hierarchy`
- `par_merge_grid`
- `par_multirasters`
- `vect_valid_repair`

Missing top-level documentation
- See [`usethis::use_package_doc`](https://usethis.r-lib.org/reference/use_package_doc.html)
- Consider using this space to translate the flowchart into a written overview of the main functions with inputs and outputs

Missing link to external functions / packages
- anticlust `par_group_balanced`
- TODO find more

Using :: or both :: and library in examples
- `clip_vec_ext`
- `clip_ras_ext`
- `datamod`
- `dep_check`
- `dep_switch`
- ...

`par_group_balanced`
- Users may benefit from a definition of an "inexhaustive grid"

Vignettes

- README
    - "Examples will navigate par_grid, par_hierarchy, and par_multirasters functions in chopin to parallelize geospatial operations." 
        - par_grid: parallelize over artificial grid polygons 
        - chopin::par_hierarchy: parallelize geospatial computations using intrinsic data hierarchy 
        - par_multirasters: parallelize over multiple rasters 
        - Parallelization of a generic geospatial operation 
- Good practice of using `chopin` in HPC
    - Assumptions
    - Basic workflow
- Generate computational grids
    - Computational grids
    - Types of computational grids and their generation
    - Visualize computational grids
- Extracting Weather/Climate Geospatial Data with `chopin`
    - Introduction
    - TerraClimate
    - PRISM dataset
    - Scaled up examples
    - Discussion: which strategy is better? stacked vs file-based parallelization



Could consider splitting information about HPC or hardware into its own vignette

"Generate computational grids"
- under "Types of computational grids and their generation" the authors note "There are two approaches to generate computational grids. One is to use par_make_gridset() with one of three modes and the other is to use par_group_grid(). Thus, users have four options in total to generate computational grids."
    - Given their shared purpose, I would expect the functions are more similarly named or alternatively are combined with an additional option "balanced"
- images on the website are giving 404 errors

Extracting Weather/Climate Geospatial Data with `chopin`
- `pkgs <-   c("chopin", "terra", "stars", "sf", "future", "doFuture", "dplyr", "parallelly", "tigris", "tictoc") invisible(sapply(pkgs, library, character.only = TRUE, quietly = TRUE))` 
    - packages loaded twice, once in Introduction and once in Discussion
    - consider loading packages in way that most users will be more familiar with eg. `library(chopin)`
    - no images or plots though a user may be expecting to see a visual result from the functions


Using :: or both :: and library in vignettes
- "Generate computational grids"
- Extracting Weather/Climate Geospatial Data with `chopin`

Some shorter lists to compare options or list steps can be helpful but, generally, I find a full page of bullets hard to process. 
- Generate computational grids
- Good practice of using `chopin` in HPC


Missing link to external functions / packages
- anticlust "Generate computational grids"
- future.apply "Good practice of using `chopin` in HPC"
- tigris, terra, ... "Extracting Weather/Climate Geospatial Data with `chopin`"

Consider moving system.time benchmarking to a separate vignette? This could also potentially include tips for saving time and memory, and/or hardware recommendations. 
- README
- "Extracting Weather/Climate Geospatial Data with `chopin`"

It is unclear to a user which vignette is the introductory one. The rOpenSci Packaging Guide suggests "The general vignette should present a series of examples progressing in complexity from basic to advanced usage.". At the moment, this looks most like the "Extracting Weather/Climate Geospatial Data with `chopin`" vignette but the title is fairly specific. 
TODO continue


Function documentation

Missing documentation of argument defaults
- `clip_ras_ext` nqsegs = 180L
- `extract_at_poly` func = mean
- ...



Found some URLs moved or broken

```
> urlchecker::url_check()
! Warning: vignettes/v02_climate_examples.Rmd:135:107 Moved
Fourteen variables are available in TerraClimate data. The table below is from [the TerraClimate website](http://www.climatologylab.org/terraclimate-variables.html).
                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                                                                          https://www.climatologylab.org/terraclimate-variables.html
✖ Error: man/par_make_gridset.Rd:45:11 Error: CRAN URL not in canonical form
See \href{https://cran.r-project.org/web/packages/units/vignettes/measurement_units_in_R.html}{link}
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
✖ Error: man/summarize_sedc.Rd:86:13 403: Forbidden
\item \href{https://dx.doi.org/10.1021/es203152a}{Messier KP, Akita Y, Serre ML. (2012). Integrating Address Geocoding, Land Use Regression, and Spatiotemporal Geostatistical Estimation for Groundwater Tetrachloroethylene. \emph{Environmental Science & Technology} 46(5), 2772-2780. }
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
✖ Error: README.md:656:16 404: Not Found
    [vignette](https://kyle-messier.github.io/chopin/articles/v02_climate_examples.html)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
✖ Error: man/summarize_sedc.Rd:87:32 Error: SSL certificate problem: unable to get local issuer certificate
\item Wiesner C. (n.d.). \href{https://mserre.sph.unc.edu/BMElab_web/SEDCtutorial/index.html}{Euclidean Sum of Exponentially Decaying Contributions Tutorial}
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
✖ Error: README.md:74:24 Error: SSL certificate problem: unable to get local issuer certificate
        contributions](https://mserre.sph.unc.edu/BMElab_web/SEDCtutorial/index.html)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```



Testing

There is good test coverage in the package but I am a bit concerned about the number of times the authors use the `expect_no_error` function. 
When I think of effective package testing, I think of both clarity for the user reading the tests and in the authors setting up expectations for how the package may fail (anticipating your own errors, warnings or messages). What does the test `expect_no_error` communicate to the user or set up as expectations?

Here are some ideas for expanding or adjusting the tests:

- inline comments in the test scripts to explain to readers/our future selves as authors ([example](https://github.com/tidyverse/ggplot2/blob/main/tests/testthat/test-coord-flip.R))
- narrow the scope of each `test_that()` call and expand on the description
    - from [https://testthat.r-lib.org/reference/test_that.html], "A test encapsulates a series of expectations about a small, self-contained unit of functionality"
    - comparing in {chopin} eg. `test-gridding.R` ([L116](https://github.com/NIEHS/chopin/blob/main/tests/testthat/test-gridding.R#L116C1-L116C50)) to eg.{rnaturalearth} [`test_ne_states.R`](https://github.com/ropensci/rnaturalearth/blob/master/tests/testthat/test_ne_states.R)
        - we see {chopin} have one blanket description "grid split is well done" to contains all the tests
        - the {rnaturalearth} test has four smaller, more digestible test_that chunks that run a series of related tests
        - as a reader, I know what I'm looking at and find it easy to look for a specific test
        - as a potential contributor, I know which test might be related to my bug, or I have a good example of how to structure a potential new test in a pull request
- more examples: [dplyr test-join-cols.R](https://github.com/tidyverse/dplyr/blob/main/tests/testthat/test-join-cols.R), [purrr test-pluck.R](https://github.com/tidyverse/purrr/blob/main/tests/testthat/test-pluck.R)



```r
library(data.table)

paths <- dir('../chopin/tests/testthat', full.names = TRUE)
DT <- data.table(path = paths)

counts <- DT[, tstrsplit(grep('testthat::', readLines(path), value = TRUE), c('\\('), keep = 1), by = path]

counts[, .N, V1][order(-N)]
                                V1     N
                            <char> <int>
 1:      testthat::expect_no_error    59
 2:         testthat::expect_error    47
 3:            testthat::test_that    30
 4:         testthat::expect_equal    20
 5:          testthat::expect_true    16
 6:      testthat::expect_s4_class    12
 7:      testthat::expect_s3_class    12
 8:      testthat::expect_no_error    12
 9:         testthat::expect_equal    10
10:       testthat::expect_message     7
11:         testthat::expect_error     6
12:      testthat::expect_s3_class     5
13:          testthat::expect_true     4
14:     testthat::expect_condition     2
15:       testthat::expect_warning     2
16:       testthat::expect_warning     2
17:    testthat::expect_no_warning     1

counts[, .N, .(path, V1)][order(path, -N)]
                                                 path
                                               <char>
 1:    ../chopin/tests/testthat/test-any_class_args.R
 2:    ../chopin/tests/testthat/test-any_class_args.R
 3:    ../chopin/tests/testthat/test-any_class_args.R
 4:             ../chopin/tests/testthat/test-check.R
 5:             ../chopin/tests/testthat/test-check.R
 6:             ../chopin/tests/testthat/test-check.R
 7:             ../chopin/tests/testthat/test-check.R
 8:             ../chopin/tests/testthat/test-check.R
 9:             ../chopin/tests/testthat/test-check.R
10:             ../chopin/tests/testthat/test-check.R
11:             ../chopin/tests/testthat/test-check.R
12: ../chopin/tests/testthat/test-distribute_suites.R
13: ../chopin/tests/testthat/test-distribute_suites.R
14: ../chopin/tests/testthat/test-distribute_suites.R
15: ../chopin/tests/testthat/test-distribute_suites.R
16: ../chopin/tests/testthat/test-distribute_suites.R
17: ../chopin/tests/testthat/test-distribute_suites.R
18: ../chopin/tests/testthat/test-distribute_suites.R
19: ../chopin/tests/testthat/test-distribute_suites.R
20: ../chopin/tests/testthat/test-distribute_suites.R
21: ../chopin/tests/testthat/test-distribute_suites.R
22: ../chopin/tests/testthat/test-distribute_suites.R
23: ../chopin/tests/testthat/test-distribute_suites.R
24: ../chopin/tests/testthat/test-distribute_suites.R
25:          ../chopin/tests/testthat/test-gridding.R
26:          ../chopin/tests/testthat/test-gridding.R
27:          ../chopin/tests/testthat/test-gridding.R
28:          ../chopin/tests/testthat/test-gridding.R
29:          ../chopin/tests/testthat/test-gridding.R
30:          ../chopin/tests/testthat/test-gridding.R
31:          ../chopin/tests/testthat/test-gridding.R
32:          ../chopin/tests/testthat/test-gridding.R
33:          ../chopin/tests/testthat/test-gridding.R
34:          ../chopin/tests/testthat/test-gridding.R
35:          ../chopin/tests/testthat/test-gridding.R
36:      ../chopin/tests/testthat/test-par_fallback.R
37:      ../chopin/tests/testthat/test-par_fallback.R
38:      ../chopin/tests/testthat/test-par_fallback.R
39:     ../chopin/tests/testthat/test-preprocessing.R
40:     ../chopin/tests/testthat/test-preprocessing.R
41:     ../chopin/tests/testthat/test-preprocessing.R
42:     ../chopin/tests/testthat/test-preprocessing.R
43:     ../chopin/tests/testthat/test-preprocessing.R
44:     ../chopin/tests/testthat/test-preprocessing.R
45:        ../chopin/tests/testthat/test-processing.R
46:        ../chopin/tests/testthat/test-processing.R
47:        ../chopin/tests/testthat/test-processing.R
48:        ../chopin/tests/testthat/test-processing.R
49:        ../chopin/tests/testthat/test-processing.R
50:        ../chopin/tests/testthat/test-processing.R
51:        ../chopin/tests/testthat/test-processing.R
52:        ../chopin/tests/testthat/test-processing.R
53:        ../chopin/tests/testthat/test-processing.R
                                                 path
                                V1     N
                            <char> <int>
 1:          testthat::expect_true     5
 2:            testthat::test_that     1
 3:      testthat::expect_s4_class     1
 4:         testthat::expect_equal    10
 5:            testthat::test_that     9
 6:      testthat::expect_no_error     8
 7:         testthat::expect_error     8
 8:         testthat::expect_equal     4
 9:      testthat::expect_s3_class     2
10:      testthat::expect_s4_class     2
11:         testthat::expect_error     1
12:      testthat::expect_no_error     9
13:      testthat::expect_no_error     8
14:      testthat::expect_s3_class     5
15:            testthat::test_that     4
16:      testthat::expect_s3_class     4
17:          testthat::expect_true     4
18:         testthat::expect_error     2
19:          testthat::expect_true     2
20:         testthat::expect_error     2
21:         testthat::expect_equal     2
22:         testthat::expect_equal     2
23:     testthat::expect_condition     2
24:      testthat::expect_s4_class     1
25:         testthat::expect_error    18
26:      testthat::expect_no_error    17
27:       testthat::expect_message     7
28:            testthat::test_that     6
29:          testthat::expect_true     6
30:      testthat::expect_s4_class     6
31:         testthat::expect_equal     5
32:       testthat::expect_warning     2
33:       testthat::expect_warning     1
34:      testthat::expect_s3_class     1
35:    testthat::expect_no_warning     1
36:            testthat::test_that     1
37:      testthat::expect_no_error     1
38:         testthat::expect_error     1
39:         testthat::expect_equal     4
40:            testthat::test_that     2
41:         testthat::expect_error     2
42:         testthat::expect_equal     2
43:      testthat::expect_s3_class     1
44:      testthat::expect_s4_class     1
45:      testthat::expect_no_error    25
46:         testthat::expect_error    19
47:            testthat::test_that     7
48:      testthat::expect_s3_class     4
49:      testthat::expect_no_error     3
50:          testthat::expect_true     3
51:      testthat::expect_s4_class     1
52:         testthat::expect_equal     1
53:       testthat::expect_warning     1
                                V1     N
```                                



Examples

Package dependencies

Consider listing system requirements (eg. netcdf) using recommendations here
https://github.com/rstudio/r-system-requirements

See example from [{magick}](https://github.com/ropensci/magick/blob/master/DESCRIPTION#L20)

Version control
`usethis::git_vaccinate()`



Description

Current

```
Package: chopin
Title: CHOPIN: Computation for Climate and Health research On Parallelized INfrastructure
Description: It enables users with basic understanding on geospatial data
    and sf and terra functions to parallelize geospatial operations for
    geospatial exposure assessment modeling and covariate computation.
    Parallelization is done by dividing large datasets into sub-regions
    with regular grids and data's own hierarchy. A computation over the
    large number of raster files can be parallelized with a chopin
    function as well.
```

Suggestions

- I think there's a lot of useful information in the [flowchart](https://github.com/NIEHS/chopin/blob/main/man/figures/README-flowchart-mermaid-1.png), how can we incorporate more obviously?
- No need to repeat the package name, capitalised, in the title
- I think the acronym is neat, but the name stands on it's own. Broadening the scope would help users understand how they can use {chopin} and this starts at the title
- I don't think it's necessary to state the expectations of users in the description
- Read examples [here](https://cran.r-project.org/web/packages/available_packages_by_name.html)

```
Package: chopin
Title: Parallelize Geospatial Operations Over Sub-Regions, Regular Grids and Lists of Rasters
Description: It enables users to parallelize geospatial operations over
    sub-regions, regular grids and lists of rasters. Parallelization 
    is done by dividing large datasets into sub-regions
    with regular grids and data's own hierarchy. A computation over the
    large number of raster files can be parallelized with a chopin
    function as well. (TODO: maybe mention {future}, {exactextractr}, {terra}, {sf})
```


Misc/unsorted

- TODO check for test of 1 length integer n_clusters par_group_balanced?
- Is it necessary to reexport nc_points instead of just using the example data from sf directly? (Note it is used  directly from {sf} in the README)
- Sometimes, I wonder if wrapping the specific functions under a chopin function obscures for a user what should be an expected skill: transforming crs
    - `reproject_std` 
    - `vect_valid_repair`
- What is the difference between `is_within_ref` and `is_bbox_within_reference`?
- `extract_at_poly`
    - Could consider using `st_crs(polys) == st_crs(surf)` instead of assuming the same coordinate reference systems are used
- `par_cut_coords`
    - Could consider using `sf::st_zm(drop = TRUE)`
- Are these internal functions?
    - `datamod`
    - `dep_check`
    - `par_def_q`
    - `par_fallback`
- `par_group_balanced`
    - TODO: check example 12 groups  vs dimensions returned
- Given current documentation, it is unclear why/when/where a user use the following functions:
    - https://niehs.github.io/chopin/reference/par_fallback.html
-  Eg. `par_grid`, show an example of how to use ...
    - https://niehs.github.io/chopin/reference/par_grid.html
    - TODO: consider vignette showing this functionality?
- Title is possibly too specific
- Edit Title so chopin is lowercase and wrapped in single quotes
- As you prepare to submit to CRAN, review this list: https://github.com/ThinkR-open/prepare-for-cran
- styler
