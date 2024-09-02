defmodule UrlShortenerWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use UrlShortenerWeb, :html

  embed_templates "page_html/*"
end
