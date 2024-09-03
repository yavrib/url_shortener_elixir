defmodule UrlShortener.Repo.Migrations.CreateUrl do
  use Ecto.Migration

  def change do
    create table(:url, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :destination, :string
      add :path, :string
      add :visited, :integer
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:url, [:user_id])
  end
end
