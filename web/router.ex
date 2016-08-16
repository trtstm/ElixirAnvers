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
    
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Anvers do
  #   pipe_through :api
  # end
end
