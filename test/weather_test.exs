defmodule WeatherTest do
  use ExUnit.Case, async: true
  doctest Weather

  @api "http://api.openweathermap.org/data/2.5/weather?q="

  test "should return a encoded endpoint when take a location" do
    appid = App.Weather.get_appid()
    endpoint = App.Weather.get_endpoint("Salvador")

    assert "#{@api}Salvador&appid=#{appid}" == endpoint
  end

  test "should return Celcius when take Kelvin" do
    kelvin_example = 296.48

    celcius_examples = 23.3
    temperature = App.Weather.kelvin_to_celcius(kelvin_example)
    assert temperature == celcius_examples
  end

  test "should return temperature when take a valid location" do
    temperature = App.Weather.temperature_of("Salvador")
    assert String.contains?(temperature, "Salvador") == true
  end

  test "should return not found when take an invalid location" do
    result = App.Weather.temperature_of("00000")
    assert result == "00000 not found"
  end
end
