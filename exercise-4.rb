class ScrambledDiary
  def initialize(contents)
    @contents = contents
  end

  def read
    @contents
  end

  def scramble(scrambler)
    @contents = scrambler.scramble(@contents)
  end

  def unscramble(scrambler)
    @contents = scrambler.unscramble(@contents)
  end
end

class CharsAdvancer
  def initialize(steps)
    @steps = steps
  end

  def scramble(contents)
    plain_chars = contents.chars
    scrambled_chars = plain_chars.map do |char|
      (char.ord + @steps).chr
    end
    scrambled_chars.join
  end

  def unscramble(contents)
    scrambled_chars = contents.chars
    plain_chars = scrambled_chars.map do |char|
      (char.ord - @steps).chr
    end
    plain_chars.join
  end
end

class Reverser
  def scramble(contents)
    contents.reverse
  end

  def unscramble(contents)
    contents.reverse
  end
end

diary = ScrambledDiary.new("These are my secrets")
puts "Diary contents #{diary.read}"
diary.scramble(Reverser.new)
puts "Diary contents after Reverser scrambles #{diary.read}"
diary.unscramble(Reverser.new)
puts "Diary contents after Reverser unscrambles #{diary.read}"
advanceBy4 = CharsAdvancer.new(4)
diary.scramble(advanceBy4)
puts "Diary contents after CharsAdvancer(4) scrambles #{diary.read}"
diary.unscramble(advanceBy4)
puts "Diary contents after CharsAdvancer(4) unscrambles #{diary.read}"
