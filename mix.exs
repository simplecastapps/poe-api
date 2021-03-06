defmodule PoeApi.Mixfile do
  use Mix.Project

  def project do
    [app: :poe_api,
     description: "high-productivity collection of tools and practices for rapidly writing production-ready applications",
     version: "0.2.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(Mix.env),
     package: package()]
  end

  def application do
    [applications: ([:logger] ++ Keyword.keys(deps(:prod)))]
  end

  defp deps(:dev) do
    [{:ex_doc, ">= 0.0.0", only: :dev}] ++ deps(:prod)
  end
  defp deps(_) do
    [{:bitfield, "~> 1.0.0"},
     {:concerto, "~> 0.1.5"},
     {:concerto_plug, "~> 0.1.3"},
     {:cowboy, "~> 2.5.0"},
     {:fugue, "~> 0.1.6"},
     {:mazurka, github: "simplecastapps/mazurka", override: true},
     {:mazurka_plug, github: "simplecastapps/mazurka_plug"},
     {:plug, "~> 1.7.0"},
     {:plug_cowboy, "~> 2.0"},
     {:plug_x_forwarded_proto, "~> 0.1.0"},
     {:poison, "3.1.0"},
     {:simple_secrets, "~> 1.0.0"},]
  end

  defp package do
    [files: ["lib", "mix.exs", "README*"],
     maintainers: ["Cameron Bytheway"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/poegroup/poe-api"}]
  end
end
