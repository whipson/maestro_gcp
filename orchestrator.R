library(maestro)

schedule <- build_schedule()

run_schedule(
  schedule,
  orch_frequency = "1 day",
  logging = FALSE
)
