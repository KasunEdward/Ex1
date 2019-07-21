use Mix.Config

config :ex1,
  ecto_repos: [Ex1.Repo]

config :ex1, Ex1.Repo,
  database: "ex1_repo",
  username: "root",
  password: "",
  hostname: "localhost"
