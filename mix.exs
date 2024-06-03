defmodule TypesenseEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :typesense_ex,
      version: "0.1.0",
      elixir: "~> 1.16",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: application_module()
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.6.1"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp application_module do
    # Check if the MIX_ENV is "test" and return nil if so
    if runtime_env() === :test, do: [], else: [mod: {TypesenseEx.Application, []}]
  end

  defp runtime_env do
    Application.get_env(:typesense_ex, :env)
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
