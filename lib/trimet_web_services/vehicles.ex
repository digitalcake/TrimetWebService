defmodule TrimetWebServices.Vehicles do

  @moduledoc """
  Documentation for TrimetWebServices.Vehicles

  This is a thin wrapper for the trimet web serivce VEHICLE LOCATION api
  https://developer.trimet.org/ws_docs/vehicle_locations_ws.shtml
  """

  @doc """
  Gets a list of trimet vehicles

  ## Params

    - options: A keyword list of options

  ## Options
  - routes          | list of route numbers
  - blocks          | list of block numbers
  - ids             | list of vehicle numbers
  - since           | time in milliseconds since epoch
  - bbox            | comma delimited list of longitude and latitude values
  - showNonRevenue  | boolean (optional) "true" or "false" (default is false)
  - onRouteOnly     | boolean (optional) "true" or "false" (default is true)
  - showStale       | boolean (optional) "true" or "false" (default is false)

  For more info about each option please review https://developer.trimet.org/ws_docs/vehicle_locations_ws.shtml


  ## Examples
      iex> TrimetWebServices.Vehicles.get
      %HTTPoison.Response{
        body: %{
          "resultSet" => %{
            "queryTime" => 1497202994240,
            "vehicle" => [
              %{"bearing" => 288, "blockID" => 9001, "delay" => -66,
                "direction" => 1, "expires" => 1497203468000, "extraBlockID" => nil,
                "garage" => "RUBY", "inCongestion" => nil, "lastLocID" => 8372,
                "lastStopSeq" => 15, "latitude" => 45.5326356, "loadPercentage" => nil,
                "locationInScheduleDay" => 38506, "longitude" => -122.6198573,
                "messageCode" => 891, "newTrip" => false, "nextLocID" => 8373,
                "nextStopSeq" => 16, "offRoute" => false, "routeNumber" => 100,
                "serviceDate" => 1497164400000, "signMessage" => "Blue to Hillsboro",
                "signMessageLong" => "MAX  Blue Line to Hillsboro", "source" => "tab",
                "time" => 1497202974634, "tripID" => "7406511", "type" => "rail",
                "vehicleID" => 103
              }, ...
            ]
          }
        }
      }
  """

  @spec get(keyword()) :: struct()
  def get(options \\ []) do
    request_options = [
      params: options
    ]
    TrimetWebServices.get!("vehicles", [], request_options)
  end

end
