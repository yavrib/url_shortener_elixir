defmodule UrlShortenerWeb.UrlsHTML do
  @moduledoc """
  This module contains pages rendered by UrlsController.

  See the `urls_html` directory for all templates available.
  """
  use UrlShortenerWeb, :html

  embed_templates "urls_html/*"

  @doc """
  Renders a urls form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def urls_form(assigns)
end
