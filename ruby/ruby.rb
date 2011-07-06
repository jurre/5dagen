module Cleaner
end

module Cleaner
  def strip_html(input)
    input.gsub('/\<\/?.*?','')
  end
end

class Someone
end

class Person < Someone #subclass van someone
  include Cleaner

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end  
end  

  def full_name
    @first_name+' '+@last_name
  end

  def to_s
    full_name
  end

  def +(other)
    full_name + ' and ' + other.full_name
  end

  def times(count, &block)
    while(count-- > 0)
      count -= 1
      block.call
    end

def times(count, &block)
  count.times(&block)

def times(count) #wordt drie keer aangeroepen
  yield 12
  yield 14
  yield 25
end

person = Person.new('Appie', 'Heijn')
