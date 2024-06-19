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
TODO: count the number of expect_no_error() / tests
https://mtlynch.io/good-developers-bad-tests/

Examples

Package dependencies

Consider listing system requirements (eg. netcdf) using recommendations here
https://github.com/rstudio/r-system-requirements


Version control
`usethis::git_vaccinate()`



TODO:

- TODO check for test of 1 length integer n_clusters par_group_balanced?
- Is it necessary to reexport nc_points instead of just using the example data from sf directly?
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