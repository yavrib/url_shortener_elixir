defmodule UrlShortener.UrlsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UrlShortener.Urls` context.
  """

  @doc """
  Generate a url.
  """
  def url_fixture(attrs \\ %{}) do
    {:ok, url} =
      attrs
      |> Enum.into(%{
        destination: "some destination",
        id: "some id",
        path: "some path",
        visited: 42
      })
      |> UrlShortener.Urls.create_url()

    url
  end
end
