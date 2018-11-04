defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # list compehension, returns a single list
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    # shuffle() returns a list
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    # member() returns a bool
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    # split() returns a tuple
    {hand, _} = Enum.split(deck, hand_size)
    hand
  end

  def save(deck, filename) do
    # use erlang to convert list to binary
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def read(filename) do
    # case w/ pattern matching
    # File.read returns a tuple
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, type} -> "File does not exist. Error: #{type}"
    end
  end

  def create_hand(hand_size) do
    # Pipe functions
    Cards.create_deck() |> Cards.shuffle() |> Cards.deal(hand_size)
  end
end
