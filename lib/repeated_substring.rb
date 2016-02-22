class RepeatedSubstring
  def find_repeated_substring(string)
    size = string.length
    substrings = Hash.new
    size.times do |i|
      size.times do |j|
        substrings[string.slice(i, j)] = 0
      end
    end
    # count occurences of each substring
    substrings.each do |key, occurences|
      key = key.gsub(/\n/, "")
      if key.size > 1
        substrings[key] = string.scan(/#{key}/).count
      end
    end
    # pick only those with occurences >= 2, sort it by key length and value
    substrings_sorted = substrings.select {|key, value| value >= 2}.sort_by {|k,v| [k.length, v]}.to_h
    # out best guess
    last_item = [substrings_sorted.keys.last, substrings_sorted.values.last]
    if last_item[0] == nil
      return "NONE"
    end
    # first occurence based on guess's key length and its count
    top = substrings.select { |key, value| key.length == last_item[0].length && value >= last_item[1]}.first
    if top[0] == nil
      return "NONE"
    end
    return top[0]
  end

  def find_repeated_substring_file(file_path)
    File.open(file_path).read.each_line.map { |line| find_repeated_substring(line) }
  end
end
