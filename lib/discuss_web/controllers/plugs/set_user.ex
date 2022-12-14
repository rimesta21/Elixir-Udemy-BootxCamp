defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    #executes the first true
    cond do
      #returns the second value but checks both statements to be true
      user = user_id && Repo.get(User, user_id) ->
        #conn.assigns.user => user struct
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end

  end

end
