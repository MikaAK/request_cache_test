defmodule RequestCacheTestWeb.TestController do
  use RequestCacheTestWeb, :controller

  IO.puts "Setup items for testing..."

  @item_100_bytes Map.new(1..25, fn i ->
    {i, Enum.random(?a..?z)}
  end)

  IO.puts "100b: #{@item_100_bytes |> :erlang.term_to_binary |> byte_size}"

  @item_10_kb Map.new(1..1750, fn i ->
    {i, Enum.random(?a..?z)}
  end)

  IO.puts "10kb: #{@item_10_kb |> :erlang.term_to_binary |> byte_size}"

  @item_100_kb Map.new(1..15_000, fn i ->
    {i, Enum.random(?a..?z)}
  end)

  IO.puts "100kb: #{@item_100_kb |> :erlang.term_to_binary |> byte_size}"

  @item_10_mb Map.new(1..1_500_000, fn i ->
    {i, Enum.random(?a..?z)}
  end)

  IO.puts "10mb: #{@item_10_mb |> :erlang.term_to_binary |> byte_size}"

  @item_plus_100_mb Map.new(1..15_000_000, fn i ->
    {i, Enum.random(?a..?z)}
  end)

  IO.puts "100mb: #{@item_plus_100_mb |> :erlang.term_to_binary |> byte_size}"

  @large_item Jason.decode!(File.read!("./large-item.json"))

  IO.puts "large_item: #{@large_item |> :erlang.term_to_binary |> byte_size}"

  @large_items Map.new(1..100, fn i ->
    {i, @large_item}
  end)

  IO.puts "large_items: #{@large_items |> :erlang.term_to_binary |> byte_size}"

  def test_100b(conn, _) do
    conn
      # |> RequestCache.store(:timer.minutes(60))
      |> put_status(:ok)
      |> json(@item_100_bytes)
  end

  def test_10kb(conn, _) do
    conn
      # |> RequestCache.store(:timer.minutes(60))
      |> put_status(:ok)
      |> json(@item_10_kb)
  end

  def test_100kb(conn, _) do
    conn
      # |> RequestCache.store(:timer.minutes(60))
      |> put_status(:ok)
      |> json(@item_100_kb)
  end

  def test_10mb(conn, _) do
    conn
      # |> RequestCache.store(:timer.minutes(60))
      |> put_status(:ok)
      |> json(@item_10_mb)
  end

  def test_100mb(conn, _) do
    conn
      # |> RequestCache.store(:timer.minutes(60))
      |> put_status(:ok)
      |> json(@item_plus_100_mb)
  end

  def test_large(conn, _) do
    conn
      # |> RequestCache.store(:timer.minutes(60))
      |> put_status(:ok)
      |> json(@large_item)
  end

  def test_larges(conn, _) do
    conn
      # |> RequestCache.store(:timer.minutes(60))
      |> put_status(:ok)
      |> json(@large_items)
  end
end
