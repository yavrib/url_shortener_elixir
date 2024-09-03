defmodule UrlShortenerWeb.UrlsController do
  use UrlShortenerWeb, :controller

  alias UrlShortener.Urls
  alias UrlShortener.Urls.Url

  def new(conn, _params) do
    changeset = Urls.change_url(%Url{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"url" => %{ "destination" => destination }}) do
    user_id = conn.assigns.current_user.id
    case Urls.create_url(%{ "destination" => destination, "user_id" => user_id }) do
      {:ok, url} ->
        conn
        |> put_flash(:info, "Url created successfully.")
        |> redirect(to: ~p"/urls/#{url}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Urls.get_url!(id)
    render(conn, :show, url: url)
  end

  def all(conn, _) do
    urls = Urls.get_url_by_user(conn.assigns.current_user.id)
    render(conn, :all, urls: urls)
  end

  def path(conn, %{"path" => path}) do
    url = Urls.get_url_by_path!(path)
    Urls.visit(url.id)
    redirect(conn, external: url.destination)
  end

  def remove(conn, %{"id" => id}) do
    Urls.delete_url(Urls.get_url!(id))
    redirect(conn, to: ~p"/")
  end
end
