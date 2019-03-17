
pkgs <- c(
    # tidyverse suite
    'tidyverse',
    'dplyr',
    'devtools',
    'formatR',
    'remotes',
    'selectr',
    'caTools',
    'pryr',
    # Bioconductor packages
    "OrganismDbi",
    "ExperimentHub",
    "Biobase",
    "BiocParallel",
    "biomaRt",
    "Biostrings",
    "BSgenome",
    "ShortRead",
    "IRanges",
    "GenomicRanges",
    "GenomicAlignments",
    "GenomicFeatures",
    "SummarizedExperiment",
    "VariantAnnotation",
    "DelayedArray",
    'ComplexHeatmap',
    "GSEABase",
    "Gviz",
    "graph",
    "RBGL",
    "Rgraphviz",
    "rmarkdown",
    "httr",
    "knitr",
    "BiocStyle",

    # Jrocker ADD
    # machine-learning
    "MLSeq",
    "ballgown",
    "clusterProfiler",
    'rJava',
    'e1071',
    'kernlab',
    'mlr',
    'mlbench',
    'randomForest',
    'randomForestSRC',
    'FactoMineR',
    'factoextra',
    'caret',
    'AppliedPredictiveModeling',
    'gbm',
    'clue',
    'clValid',
    'clusterSim',
    'PMCMR',
    'ranger',
    'cmaes',
    'irace',
    'emoa',
    'FSelector',
    'FNN',
    'ROCR',

    # other packages
    'openxlsx',
    'gt',
    'GGally',
    'ggvis'
    )

ap.db <- available.packages(contrib.url(BiocManager::repositories()))
ap <- rownames(ap.db)
pkgs_to_install <- pkgs[pkgs %in% ap]

BiocManager::install(pkgs_to_install, update=FALSE, ask=FALSE)
# From github
devtools::install_github("hadley/multidplyr")

# just in case there were warnings, we want to see them
# without having to scroll up:
warnings()

if (!is.null(warnings()))
{
    w <- capture.output(warnings())
    if (length(grep("is not available|had non-zero exit status", w))) quit("no", 1L)
}

suppressWarnings(BiocManager::install(update=TRUE, ask=FALSE))
