class String 
  
  def first_anagram?(string)
    array = self.chars.permutation
    array = array.map {|el| el.join}
    array.include?(string)
  end 
  
  def second_anagram?(string)
    self.chars.uniq.each do |char|
      return false unless self.count(char) == string.count(char)
    end
    true
  end 
  
  
  
  
end 