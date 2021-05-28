defmodule Cards do
  @moduledoc """
  provide methods and handling deck of cards
  """
  @doc """
    returns the list of string of dec of cards
     ### Examples

      <iex deck = Cards.create_deck
      deck

  """
  def create_deck do
    values = ["ace", "two", "three", "four", "five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # cards =  for value <- values do
    #   for suit <- suits do

    #       "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards)
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    takes the deck parameter which is `create_deck` in our case and `shuffle` it

     ### Examples

      <iex deck = Cards.create_deck
      <iex hand =Cards.shuffle(deck)
      hand


  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
   takes deck which is `create_deck` in our case and card return boolean if the card exist in our deck
   if it exists it return true and if it doesnot then it return false

    ### Examples

      <iex deck = Cards.create_deck
      <iex Cards.deal(deck, "ace of spades")
      true


  """
  def contain?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  takes `deck` and `hand_size` which means number and split into the array or list of tuples

  ### Examples

      <iex deck = Cards.create_deck
      <iex {hand ,deck} =Cards.deal(deck, 1)
      hand
      ["Ace of spades"]

  """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  takes deck and file name and write it into our computer system
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    read the file consist in the system and convert it into the array
  """
  def read(filename) do
    case File.read(filename) do
      {:ok, binary} ->
        :erlang.binary_to_term(binary)

      {:error, _reason} ->
        "That file doesnot exist"
    end
  end

  @doc """
  pipe operator which basically means we dont have to assign any value it call the deck and shuffles
  it and splits into array or list of list
  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
