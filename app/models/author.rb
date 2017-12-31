class Author < ApplicationRecord

#   appends first and last name replaced in author_type.rb
#   def full_name
#     [self.first_name, self.last_name].compact.join(' ')
#   end

  def coordinates
    [rand(50), rand(90)]
  end

  def publication_years
    (1..rand(10)).to_a.map{1900 + rand(117)}
  end
end