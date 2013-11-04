Given /the following movies exist/ do |movies_table|  # Populate movie db
  movies_table.hashes.each do |movie|
      Movie.create(movie)
  end
  assert movies_table.hashes.size == Movie.all.count
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|  # Assert sort
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |field|
    field = field.strip
    if uncheck == 'un'
      step %Q"I uncheck the 'ratings_#{field}'"
      step %Q"the 'ratings_#{field}' checkbox should not be checked"
    else
      step %Q"I check the 'ratings_#{field}'"
      step %Q"the 'ratings_#{field}' checkbox should be checked"
    end
  end
end

Then /^I should (not )?see the following ratings: (.*)/ do |not_see, rating_list|
  flunk "Unimplemented"
end

Then /^I should see (none|all) of the movies$/ do |should|
  flunk "Unimplemented"
end
