defmodule IslandsEngine.Game do
  use GenServer

  # Invoked by Kernel.send(game, :first)
  def handle_info(:first, state) do
    IO.puts("This message has been handled by handle_info/2, matching on :first.")
    {:noreply, state}
  end

  # Invoked by GenServer.call(game, :demo_call)
  def handle_call(:demo_call, _from, state) do
    {:reply, state, state}
  end

  def demo_call(game) do
    GenServer.call(game, :demo_call)
  end

  # Invoked by GenServer.cast(game, {:demo_cast, "another value"})
  def handle_cast({:demo_cast, new_value}, state) do
    {:noreply, Map.put(state, :test, new_value)}
  end

  def demo_cast(pid, new_value) do
    GenServer.cast(pid, {:demo_cast, new_value})
  end
end
