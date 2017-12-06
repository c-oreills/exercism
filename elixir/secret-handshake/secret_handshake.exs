use Bitwise

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @command_codes [
    {"wink", 0b1},
    {"double blink", 0b10},
    {"close your eyes", 0b100},
    {"jump", 0b1000},
  ]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    commands = for {command, binary_part} <- @command_codes, 0 < (binary_part &&& code), do: command
    if 0 < (0b10000 &&& code), do: Enum.reverse(commands), else: commands
  end
end

