defmodule Anvers.Admin.UserController do
  use Anvers.Web, :controller

  alias Anvers.User

  defp redirect_if_logged_in(conn) do
    if Addict.Helper.is_logged_in(conn) do
      redirect(conn, to: admin_path(conn, :index))
    end
  end

  def login(conn, _) do
    redirect_if_logged_in(conn)

    render(conn, "login.html")
  end

  def do_login(conn, auth_params) do
    redirect_if_logged_in(conn)

    auth_params = parse(auth_params)
    result = with {:ok, user} <- Addict.Interactors.Login.call(auth_params),
                  {:ok, conn} <- Addict.Interactors.CreateSession.call(conn, user),
              do: {:ok, conn, user}

    case result do
      {:ok, conn, user} -> redirect(conn, to: admin_path(conn, :index))
      {:error, errors} -> redirect(conn, to: user_path(conn, :login))
    end
  end

  def logout(conn, _) do
    if Addict.Helper.is_logged_in(conn) == false do
      redirect(conn, to: page_path(conn, :index))
    end

   case Addict.Interactors.DestroySession.call(conn) do
     {:ok, conn} -> redirect(conn, to: page_path(conn, :index))
     {:error, errors} -> redirect(conn, to: admin_path(conn, :index))
   end
  end

  def do_register(conn, user_params) do
    redirect_if_logged_in(conn)

    user_params = parse(user_params)
    result = with {:ok, user} <- Addict.Interactors.Register.call(user_params),
                  {:ok, conn} <- Addict.Interactors.CreateSession.call(conn, user),
              do: {:ok, conn, user}

    case result do
      {:ok, conn, user} -> redirect(conn, to: admin_path(conn, :index))
      {:error, errors} -> redirect(conn, to: user_path(conn, :register))
    end
  end

  def register(conn, _) do
    redirect_if_logged_in(conn)

    render(conn, "register.html")
  end

  defp parse(user_params) do
    if user_params[schema_name_string] != nil do
      user_params[schema_name_string]
    else
      user_params
    end
  end

  defp schema_name_string do
    to_string(Addict.Configs.user_schema)
    |> String.split(".")
    |> Enum.at(-1)
    |> String.downcase
  end

end
