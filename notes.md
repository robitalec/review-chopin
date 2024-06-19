README

- consider explicitly loading required packages for examples in visible code chunks

```
## To run the examples
- RStudio: download and open this document then press "Run All Chunks Above", "Run All Chunks Below", or "Restart R and Run All Chunks", whichever is appropriate.
- Visual Studio Code (with R extension): download and open this document then press "Run Above" at the last code chunk.
- If you prefer command line (i.e., in Unix-like operating systems), run:

git clone https://github.com/Spatiotemporal-Exposures-and-Toxicology/chopin
cd chopin
Rscript -e \
"
knitr::purl(\"README.Rmd\", \"README_run.r\")
source(\"README_run.r\")
"
```

`git clone https://github.com/Spatiotemporal-Exposures-and-Toxicology/chopin`
- repo moved
`source(\"README_run.r\")`
- DiagrammeR needs to be installed, consider adding to the rlang check installed line




https://github.com/NIEHS/chopin?tab=readme-ov-file#installation

Installation should also help users install the dependencies of {chopin}

- sf https://github.com/r-spatial/sf?tab=readme-ov-file#installing
- exactextract https://github.com/isciences/exactextractr?tab=readme-ov-file#dependencies
- terra https://github.com/rspatial/terra?tab=readme-ov-file#installation
- igraph https://github.com/igraph/rigraph?tab=readme-ov-file#installation, https://r.igraph.org/articles/installation-troubleshooting



Consider S3 instead of dep check and if == 'terra' else if  == 'sf'
https://adv-r.hadley.nz/s3.html#s3-methods

See eg. tmap 
https://github.com/r-tmap/tmap/blob/master/R/tmapShape.R



version numbering
