defmodule RequestCacheTestWeb.Router do
  use RequestCacheTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RequestCacheTestWeb do
    pipe_through :api

    get "/100-bytes", TestController, :test_100b
    get "/10-kb", TestController, :test_10kb
    get "/100-kb", TestController, :test_100kb
    get "/10-mb", TestController, :test_10mb
    get "/100-mb", TestController, :test_100mb
    get "/large-item", TestController, :test_large
    get "/large-items", TestController, :test_larges
  end
end
