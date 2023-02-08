defmodule OtelGettingStarted.MixProject do
  use Mix.Project

  def project do
    [
      app: :otel_getting_started,
      version: "0.1.0",
      elixir: "~> 1.14",
      releases: releases(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {OtelGettingStarted.Application, []}
    ]
  end

  def releases() do
    [
      otel_getting_started: [
        version: "0.0.1",
        applications: [
          otel_getting_started: :permanent,
          opentelemetry_exporter: :permanent,
          opentelemetry: :temporary
        ]
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:opentelemetry_api, "~> 1.0"},
      {:opentelemetry, "~> 1.0"},
      {:opentelemetry_exporter, "~> 1.0"}
    ]
  end
end
