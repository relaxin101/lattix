defmodule LattixWeb.ProfileHTML do
  use LattixWeb, :html

  def index(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        Create a new post
      </.header>
      <.simple_form
        for={@form}
        id="registration_form"
        phx-submit="save"
        phx-change="validate"
        action={~p"/"}
        method="post"
      >
        <.input field={@form[:title]} type="text" label="Title" required />
        <.input field={@form[:content]} type="text" label="Content" required />
        <:actions>
          <.button phx-disable-with="Creating post..." class="w-full">Create an account</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end
end
