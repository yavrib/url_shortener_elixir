defmodule UrlShortenerWeb.UsersHTML do
  @moduledoc """
  This module contains pages rendered by UrlsController.

  See the `users_html` directory for all templates available.
  """
  use UrlShortenerWeb, :html

  embed_templates "users_html/*"

  @doc """
  Renders a users form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def users_form(assigns)
end
