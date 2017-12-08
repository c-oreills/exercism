defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    String.to_charlist(text)
    |> Enum.map(&(Map.get(rotated_mapping(?a, ?z, shift), &1, &1)))
    |> Enum.map(&(Map.get(rotated_mapping(?A, ?Z, shift), &1, &1)))
    |> List.to_string()
  end

  def rotated_mapping(start_char, end_char, shift) do
    for char <- start_char..end_char, into: %{} do
      shifted_char = char + shift
      {char, (if shifted_char <= end_char, do: shifted_char, else: shifted_char - 26)}
      end
  end
end

