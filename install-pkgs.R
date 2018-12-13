pkgs <- c(

  # machine-learing
  'e1071',
  'mlr'
)
mirror <- 'https://cloud.r-project.org'
ap.db <- available.packages(contrib.url(mirror))
ap <- rownames(ap.db)

pkgs_to_install <- pkgs[pkgs %in% ap]

install.packages(pkgs = pkgs_to_install, repos = mirror)

warnings()

if (!is.null(warnings()))
{
    w <- capture.output(warnings())
    if (length(grep("is not available|had non-zero exit status", w)))
        quit("no", 1L)
}