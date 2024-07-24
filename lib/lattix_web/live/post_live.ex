defmodule LattixWeb.PostLive do
  alias Lattix.Repo
  use LattixWeb, :live_view
  alias Lattix.Posts

  def render(assigns) do
    ~H"""
    <div>
      <h1>
        Title: <%= @post.title %>
      </h1>
      <%= @post.content %>
      by <%= @post.author.name %>

    </div>
    <div class="p-3 mt-3">
    <.link  class="btn rounded-md bg-green-500 p-3 mt-9" navigate={~p"/"}> Home </.link>
    </div>

    """
  end

  def mount(%{"id" => id}, _session, socket) do
    post = Posts.get_post!(id) |> Repo.preload(:author, [])

    {:ok, assign(socket, :post, post)}
  end
end
