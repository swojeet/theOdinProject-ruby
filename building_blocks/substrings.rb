#Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

def substrings(string, dictionary)
  found_strings = Hash.new(0)
  dictionary.each do |word|
    times_appeared = string.downcase.scan(word).length
    found_strings[word] = times_appeared if times_appeared > 0
  end
  found_strings
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)
