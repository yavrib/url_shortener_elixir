defmodule UrlShortener.Urls.Url do
  use Ecto.Schema
  import Ecto.Changeset
  import EctoCommons.URLValidator

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "url" do
    field :path, :string
    field :destination, :string
    field :visited, :integer
    field :user_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:id, :destination, :path, :visited, :user_id])
    |> validate_required([:id, :destination, :path, :visited, :user_id])
    |> validate_url(:destination)
  end
end
