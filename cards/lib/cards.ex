defmodule Cards do
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

  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
      Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
      Enum.split(deck, hand_size)
  end
end
