defmodule Pathfinder.RoverTest do
  use ExUnit.Case
  import Pathfinder.Rover

  test "Turn left from north" do
    expected =
      new()
      |> left()

    assert expected.orientation == :west
  end

  test "Turn right from north" do
    expected =
      new()
      |> left()

    assert expected.orientation == :east
  end

  test "moves forward" do
    expected =
      new()
      |> forward()

    assert expected.point == {0, -1}
  end

  test "makes multiple moves" do
    expected =
      new()
      |> left()
      |> assert_field(:orientation, :west)
      |> forward()
      |> assert_field(:point, {-1, 0})
      |> left()
      |> assert_field(:orientation, :south)
      |> forward()
      |> assert_field(:point, {-1, 1})
      |> right()

    assert expected.point == {-1, 1}
    assert expected.orientation == :west
  end

  def assert_field(rover, field, value) do
    assert Map.get(rover, field) == value
    rover
  end
end
