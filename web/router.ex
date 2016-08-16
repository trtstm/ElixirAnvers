defmodule Anvers.Router do
  use Anvers.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Anvers do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/contact", PageController, :contact
    get "/about", PageController, :about

    get "/posts", PostController, :index
    get "/posts/:id", PostController, :show
  end

  scope "/admin", Anvers do
    pipe_through :browser

    get "/", AdminController, :index
    get "/posts", AdminController, :index_post
    get "/posts/:id/edit", AdminController, :edit_post
    get "/posts/new", AdminController, :new_post
    post "/posts", AdminController, :create_post
    patch "/posts/:id", AdminController, :update_post
    put "/posts/:id", AdminController, :update_post
    delete "/posts/:id", AdminController, :delete_post


  end


  # Other scopes may use custom stacks.
  # scope "/api", Anvers do
  #   pipe_through :api
  # end
end
