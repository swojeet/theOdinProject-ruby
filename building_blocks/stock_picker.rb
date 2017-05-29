#Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

def stock_picker(stock_prices)
  copy_array = stock_prices.dup
  best_buy = best_sell = 0
  while ((best_buy == 0 && best_sell == 0) || best_sell == 0 ) do
    max_value = copy_array.max
    copy_array.delete(max_value)
    best_sell = stock_prices.find_index(max_value)
    #initially setting it to the best sell price to compare the smaller values
    min = stock_prices[best_sell]
    for x in (0..best_sell) do 
      min = stock_prices[x] if stock_prices[x] < min 
      best_buy = stock_prices.find_index(min)
    end
  end
  return "No Profit" if best_buy == best_sell
  [best_buy, best_sell]
end

stock_picker([17,3,6,9,15,8,6,1,10])
