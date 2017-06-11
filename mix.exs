defmodule TrimetWebServices.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :trimet_web_services,
     version: @version,
     elixir: "~> 1.4",
     description: "A thin wrapper for Trimet Web Service",
     name: "TrimetWebServices",
     source_url: "https://github.com/digitalcake/TrimetWebService",
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     docs: [main: "TrimetWebServices", source_ref: "v#{@version}",
       source_url: "https://github.com/digitalcake/TrimetWebService"]
     ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {TrimetWebServices.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.11.2"},
      {:poison, "~> 3.1"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end
  defp package do
    [description: "A thin wrapper for Trimet Web Services",
     files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Josh Chernoff"],
     licenses: ["MIT"],
     links: %{github: "https://github.com/digitalcake/TrimetWebService"}]
  end
end
