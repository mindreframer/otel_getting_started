# OtelGettingStarted

Troubles to send traces from Elixir to uptrace.


```bash 
# download sample project
$ git clone https://github.com/mindreframer/otel_getting_started.git
$ cd otel_getting_started
$ mix deps.get


# start uptrace
$ ./uptrace --config uptrace-config/uptrace.yml serve


# start elixir app
$ iex -S mix 
# wait until `[info] OTLP exporter successfully initialized`
iex> OtelGettingStarted.hello()

# output after some delay
# `[info] error response from service exported to status=405`
```



### LOGS  - Uptrace

status 405 - denied
```
[bunrouter]  23:30:53.719  1741fa092f9068d0f1f2f197f127846f   405         31µs   POST     /1/v1/traces
[bunrouter]  23:45:07.757  1741fad0083fa71027fe37c5ac8994e5   405          6µs   POST     /1
[bunrouter]  23:48:45.096  1741fb02a2abd6207bea865c6e3e4e7f   405          8µs   POST     /1/v1/traces
[bunrouter]  23:51:00.134  1741fb2213994da894949b6e1306e4c5   405         14µs   POST     /1/v1/traces
```


Config Uptrace

```yaml
listen:
  # OTLP/gRPC API.
  grpc:
    addr: ":14317"
  # OTLP/HTTP and Uptrace API with UI.
  http:
    addr: ":14318"

projects:
  - id: 1
    name: SampleApp
    # Token grants write access to the project. Keep a secret.
    token: project1_secret_token
    # A list of attributes to pin on the Overview page.
    pinned_attrs:
      - service.name
      - host.name
      - deployment.environment

```

Config Elixir

```elixir
config :opentelemetry_exporter,
  otlp_protocol: :http_protobuf,
  otlp_endpoint: "http://project1_secret_token@localhost:14318/1"
```
