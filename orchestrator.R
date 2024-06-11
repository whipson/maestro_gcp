library(maestro)

schedule <- build_schedule()

run_schedule(
  schedule,
  orch_frequency = "15 minutes",
  logging = FALSE
)
