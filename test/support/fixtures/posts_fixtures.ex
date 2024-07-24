defmodule Lattix.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lattix.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{})
      |> Lattix.Posts.create_post()

    post
  end
end
