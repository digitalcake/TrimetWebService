defmodule TrimetWebServices do
  @moduledoc false
  use HTTPoison.Base

  def process_url(endpoint) do
    "https://developer.trimet.org/ws/v2/" <> endpoint
  end

  def process_response_body(body) do
    Poison.decode!(body)
  end

  def process_request_options(options) do
    [params: Keyword.merge([appid: Application.get_env(:trimet_web_services, :appid)], options[:params])]
  end

end
