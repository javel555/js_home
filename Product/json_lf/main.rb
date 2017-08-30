# get argv
$command = ARGV[0]

# temps
$tabStack = 0
$push_keys = ['{', '[']
$pop_keys  = ['}', ']']
$lf_keys   = [',']

def main
  # view usage
  if $command == '-h'
    puts <<-USAGE
  json_lf
    USAGE
  else
    # get command
    inFilePath = $command
    # open file
    f = File.open(inFilePath, 'r') do |file|
      result = ""
      # find kyeword
      file.each_char do |c|
        result << get_c(c)
      end
      puts result
    end
  end
end

def get_c(char)
  if $push_keys.include?(char)
    $tabStack += 1
    return char + "\n" + tabStr
  elsif $pop_keys.include?(char)
    $tabStack -= 1
    return char + "\n" + tabStr
  elsif $lf_keys.include?(char)
    return char + "\n" + tabStr
  else
    return char
  end
end

def tabStr
  ret = ""
  $tabStack.times do
    ret << "\t"
  end
  return ret
end

main()