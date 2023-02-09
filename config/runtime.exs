import Config

config :opentelemetry,
  span_processor: :batch,
  traces_exporter: {:otel_exporter_stdout, []}

config :opentelemetry, :resource, service: %{name: "OTEL_STARTED"}

config :opentelemetry, :processors,
  otel_batch_processor: %{
    exporter: {
      :opentelemetry_exporter,
      # %{endpoints: ["http://project1_secret_token@localhost:14318/1"]}
      %{endpoints: ["http://project1_secret_token@localhost:14317/1"]}
    }
  }

config :opentelemetry,
  span_processor: :batch,
  traces_exporter: :otlp


# GRPC
config :opentelemetry_exporter,
  otlp_protocol: :grpc,
  otlp_headers: [{"uptrace-dsn", "http://project1_secret_token@localhost:14317/1"}],
  otlp_endpoint: "http://project1_secret_token@localhost:14317/1"


# # HTTP 
# config :opentelemetry_exporter,
#   otlp_protocol: :http_protobuf,
#   otlp_headers: [{"uptrace-dsn", "http://project1_secret_token@localhost:14318/1"}],
#   otlp_endpoint: "http://project1_secret_token@localhost:14318/1"
