import Config

config :opentelemetry,
  span_processor: :batch,
  traces_exporter: {:otel_exporter_stdout, []}

config :opentelemetry,
  span_processor: :batch,
  traces_exporter: :otlp

config :opentelemetry_exporter,
  otlp_protocol: :http_protobuf,
  otlp_endpoint: "http://project1_secret_token@localhost:14318/1"

