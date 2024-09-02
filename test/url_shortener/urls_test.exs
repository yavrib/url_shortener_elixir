defmodule UrlShortener.UrlsTest do
  use UrlShortener.DataCase

  alias UrlShortener.Urls

  describe "url" do
    alias UrlShortener.Urls.Url

    import UrlShortener.UrlsFixtures

    @invalid_attrs %{id: nil, path: nil, destination: nil, visited: nil}

    test "list_url/0 returns all url" do
      url = url_fixture()
      assert Urls.list_url() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Urls.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      valid_attrs = %{id: "some id", path: "some path", destination: "some destination", visited: 42}

      assert {:ok, %Url{} = url} = Urls.create_url(valid_attrs)
      assert url.id == "some id"
      assert url.path == "some path"
      assert url.destination == "some destination"
      assert url.visited == 42
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Urls.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      update_attrs = %{id: "some updated id", path: "some updated path", destination: "some updated destination", visited: 43}

      assert {:ok, %Url{} = url} = Urls.update_url(url, update_attrs)
      assert url.id == "some updated id"
      assert url.path == "some updated path"
      assert url.destination == "some updated destination"
      assert url.visited == 43
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Urls.update_url(url, @invalid_attrs)
      assert url == Urls.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %Url{}} = Urls.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Urls.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Urls.change_url(url)
    end
  end
end
