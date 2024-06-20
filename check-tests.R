library(data.table)

paths <- dir('../chopin/tests/testthat', full.names = TRUE)

DT <- data.table(path = paths)

counts <- DT[, tstrsplit(grep('testthat::', readLines(path), value = TRUE), c('\\('), keep = 1), by = path]

counts[, .N, V1][order(-N)]

counts[, .N, .(path, V1)][order(path, -N)]
