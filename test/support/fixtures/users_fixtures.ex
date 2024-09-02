defmodule UrlShortener.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UrlShortener.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        id: "some id",
        password: "some password"
      })
      |> UrlShortener.Users.create_user()

    user
  end
end
