defmodule UrlShortenerWeb.UrlsController do
  use UrlShortenerWeb, :controller

  alias UrlShortener.Urls
  alias UrlShortener.Urls.Url

  def new(conn, _params) do
    changeset = Urls.change_url(%Url{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"url" => %{ "destination" => destination }}) do
    case Urls.create_url(%{ "destination" => destination }) do
      {:ok, url} ->
        conn
        |> put_flash(:info, "Url created successfully.")
        |> redirect(to: ~p"/url/#{url}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Urls.get_url!(id)
    render(conn, :show, url: url)
  end

  def navigate(conn, %{"path" => path}) do
    url = Urls.get_url_by_path!(path)
    Urls.visit(url.id)
    redirect(conn, external: url.destination)
  end
end
