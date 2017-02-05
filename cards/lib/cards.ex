defmodule Cards do
  @moduledoc """
        Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # 1) Better way, LIST ALREADY COMES FLATTENED
    for suit <- suits, value <- values do
        '#{value} of #{suit}'
    end

    # 2) Works, but... LIST MUST BE FLATTENED AFTER
    # cards = for value <- values do  - WORSE WAY
    #   for suit <- suits do  
    #     "#{value} of #{suit}" 
    #   end  
    # end  

    # List.flatten(cards)  - WORSE WAY
  end

  @doc """
    Returns your deck of cards back shuffled
  """
  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

   @doc """
    Checks if deck contains card you give
  """
  def contains?(deck, card) do
      Enum.member?(deck, card)
  end

   @doc """
    Deals a hand based on the size of hand you wish
  """
  def deal(deck, hand_size) do
      Enum.split(deck, hand_size)
  end

   @doc """
    Saves deck via. Erlang & binary
  """
  def save(deck, filename) do
      binary = :erlang.term_to_binary(deck) # Turns into saveable file w/ erlang code
      File.write(filename, binary)
  end

   @doc """
   Loads your deck of cards and converts back to string from binary via. Erlang
  """
  def load(filename) do
    {status, binary} = File.read(filename) # Take status :ok and the binary deck of cards and store into vars from tuple 
      
    case status do
        :ok -> # :ok is an atom
            :erlang.binary_to_term binary 
        :error -> # the _   we know patter matcing here but we do not care _
            'That file does not exist'
    end
  end

   @doc """
    Creates a deck, shuffles it, then deals you a hand
  """
  def create_hand(hand_size) do
    # deck = Cards.create_deck # w/out Pipe Operator
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    Cards.create_deck # w/ pipe operator
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
