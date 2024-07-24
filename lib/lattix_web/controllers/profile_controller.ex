defmodule LattixWeb.ProfileController do
  use LattixWeb, :controller

  def index(conn, _params) do
    conn =
      conn
      |> assign(:form, %{})

    render(conn, :index)
  end
end
