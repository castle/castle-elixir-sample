defmodule Castle do
  @castle_api_url "https://api.castle.io/v1"
  @castle_api_secret "api_secret"
  
  def authenticate do
    authenticate_url = "#{@castle_api_url}/authenticate"
    headers = [
      "Content-Type": "Application/json; charset=utf-8",
    ]
    options = [hackney: [basic_auth: {"", @castle_api_secret}]]
    HTTPoison.post(
      authenticate_url,
      authenticate_body(),
      headers,
      options
    )
  end
  
  defp authenticate_body do
    Poison.encode!(%{
      "event" => "$login",
      "status" => "$succeeded",
      "user_id" => "e325bcdd10ac",
      "email" => "johan@castle.io",
      "fingerprint" => "faf117b2-9457-4e3b-9c13-d2795656b78e-094e81caa170c1d2",
      "ip" => "37.46.187.90",
      "user_agent" => "Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko",
      "headers" => %{
        "Accept" => "text/html"
      },
      "context" => %{
        "library" => %{
          "name" => "castle-elixir",
          "version" => "0.0.1"
        }
      }
    })
  end
end

Castle.authenticate