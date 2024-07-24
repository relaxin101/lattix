defmodule LattixWeb.PageController do
  alias Lattix.Posts
  use LattixWeb, :controller

  def home(conn, _opts) do
    # The home page is often custom made,
    # so skip the default app layout.
    posts = case conn.assigns do 
      %{:current_user => user} when is_struct(user) -> Posts.get_user_posts(user)
      _ -> %{}
    end
    conn = conn 
      |> assign(:posts, posts)
    render(conn, :home)
  end
end
