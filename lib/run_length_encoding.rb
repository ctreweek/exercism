def run_length_encode(input)
  character = []
  output = ""
  i = 0

  while i < input.length
    if character.count < 1
      character << input[i]
    elsif character.count >= 1 && input[i] == character[0]
      character << input[i]
    elsif character.count > 1 && input[i] != character[0]
      output += character.count.to_s
      output += character[0]
      character = [input[i]]
    elsif character.count == 1 && input[i] != character[0]
      output += character[0]
      character = [input[i]]
    end
    i += 1
  end

  if character.count > 1
    output += character.count.to_s
    output += character[0]
  else
    output += character[0]
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
