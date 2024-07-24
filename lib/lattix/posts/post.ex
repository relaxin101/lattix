defmodule Lattix.Posts.Post do
  alias Lattix.Account.User
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "posts" do
    field :title, :string
    field :content, :string
    belongs_to :author, User, foreign_key: :author_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :author_id])
    |> validate_required([:title, :content])
  end
end
