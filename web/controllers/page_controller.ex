defmodule Anvers.PageController do
  use Anvers.Web, :controller

  alias Anvers.Post

  def index(conn, _params) do
    posts = Repo.all(Post)
    render(conn, "index.html", posts: posts)
  end

  def contact(conn, _params) do
    render(conn, "contact.html")
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end
end
