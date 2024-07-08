defmodule Lattix.Repo do
  use Ecto.Repo,
    otp_app: :lattix,
    adapter: Ecto.Adapters.Postgres
end
