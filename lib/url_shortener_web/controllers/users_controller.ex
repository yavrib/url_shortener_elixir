defmodule UrlShortenerWeb.UsersController do
  use UrlShortenerWeb, :controller

  alias UrlShortener.Users
  alias UrlShortener.Users.User

  def new(conn, _params) do
    changeset = Users.change_user(%User{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    IO.inspect(user_params)
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: ~p"/user/#{user}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render(conn, :show, user: user)
  end
end
