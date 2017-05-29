#Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string

def caesar_cipher(string,num)
  letters = []
  string.each_byte do |x|
    #For lowercase alphabets
    if (x > 96 && x < 123)
      x+num > 122 ? letters << (((x + num)%123)+97).chr : letters << (x+num).chr
    #For uppercase alphabets
    elsif(x>64 && x < 91)
      x+num > 90 ? letters << (((x+num)%91)+65).chr : letters << (x+num).chr
    #For digits
    elsif(x>47 && x < 58)
      x+num > 57 ? letters << (((x+num)%58)+48).chr : letters << (x+num).chr
    else
      letters << x.chr
    end
  end
  letters.join
end

puts caesar_cipher("What a string!",5)