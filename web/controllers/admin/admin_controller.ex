defmodule Anvers.AdminController do
  use Anvers.Web, :controller

  alias Anvers.Post

  plug :put_layout, "admin.html"

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def index_post(conn, _params) do
    posts = Repo.all(Post)
    render(conn, "index_post.html", posts: posts)
  end

  def edit_post(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    changeset = Post.changeset(post)
    conn
    |> assign(:post, post)
    |> assign(:changeset, changeset)
    |> render("edit_post.html")
  end

  def new_post(conn, _params) do
    changeset = Post.changeset(%Post{})
    conn
    |> assign(:changeset, changeset)
    |> render("new_post.html")
  end

  def update_post(conn, %{"id" => id, "post" => post_params}) do
    post = Repo.get!(Post, id)
    changeset = Post.changeset(post, post_params)

    case Repo.update(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, changeset} ->
        render(conn, "edit_post.html", post: post, changeset: changeset)
    end
  end

  def create_post(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)

    case Repo.insert(changeset) do
      {:ok, _post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: admin_path(conn, :index_post))
      {:error, changeset} ->
        render(conn, "new_post.html", changeset: changeset)
    end
  end

  def delete_post(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: admin_path(conn, :index_post))
  end

end
