defmodule OtelGettingStartedTest do
  use ExUnit.Case
  doctest OtelGettingStarted

  test "greets the world" do
    assert OtelGettingStarted.hello() == :world
  end
end
