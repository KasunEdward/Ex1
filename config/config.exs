use Mix.Config

config :myd,
  ecto_repos: [Ex1.Repo]

config :ex1, Ex1.Repo,
  database: "ex1_repo",
  username: "root",
  password: "",
  hostname: "localhost"
