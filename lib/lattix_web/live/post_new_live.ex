defmodule LattixWeb.PostNewLive do
  use LattixWeb, :live_view
  alias Lattix.Posts
  alias Lattix.Posts.Post

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(
        form:
          to_form(
            %Post{}
            |> Posts.change_post()
          )
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.flash_group flash={@flash} />
    <.form for={@form} phx-submit="save">
      <div class="justify-center mb-3">
        <.input field={@form[:title]} placeholder="Title.." />
        <.input field={@form[:content]} type="textarea" class="w-full, rounded-md" />
        <.button class="mt-2 bg-green-800">Save Post</.button>
      </div>
    </.form>
    """
  end

  def handle_event("save", %{"post" => post_params}, socket) do
    case Posts.create_post(socket.assigns.current_user, post_params) do
      {:ok, %{id: id}} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post created successfully")
         |> redirect(to: ~p"/posts/#{id}")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
