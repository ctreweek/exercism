def run_length_encode(input)
  input = input.chars.chunk{|letter| letter}.map{|letter, array| [letter, array.size]}
  i = 0
  output = ""
  while i < input.length
    if input[i][1] == 1
      output += input[i][0]
    else
      output += input[i][1].to_s
      output += input[i][0]
    end
    i += 1
  end
  return output
end


def run_length_decode(input)
  count = ""
  output = ""
  i = 0
  while i < input.length
    if letter?(input[i]) == false && input[i] != " "
      count += input[i]
    elsif letter?(input[i]) && count == ""
      output += input[i]
    elsif input[i] == " " && count == ""
      output += input[i]
    else
      count.to_i.times do
        output += input[i]
      end
      count = ""
    end
    i += 1
  end
  return output
end

def letter?(string)
 string.chars.any? { |char| ('a'..'z').include? char.downcase }
end
