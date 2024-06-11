library(plumber)

r <- plumb("orchestrator.R")

port <- strtoi(Sys.getenv("PORT"))

r$run(port = port, host = '0.0.0.0')
