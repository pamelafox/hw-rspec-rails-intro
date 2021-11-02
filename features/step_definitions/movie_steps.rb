# Add a declarative step here for populating the DB with movies.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(:title => movie['title'],
      :rating => movie['rating'],
      :release_date => Time.parse(movie['release_date']))
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /^I should see "(.*)" before "(.*)" in the movie list$/ do |first,second|
  regexp = /.*#{first}.*#{second}/
  expect(page.text).to match(regexp)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I check only the following ratings: PG, G, R"

When /I check the following ratings: (.*)/ do |rating_list|
  # first, uncheck all the boxes
  ['G', 'PG', 'PG-13', 'R'].each do |rating|
    uncheck("ratings[#{rating}]")
  end
  # now check the selected ones
  rating_list.split(/\s*,\s*/).each do |rating|
    check("ratings[#{rating}]")
  end
end

Then /^I should (not )?see the following movies: (.*)$/ do |no,movie_list|
  movies = movie_list.split(/\s*,\s*/).each do |movie|
    if no
      expect(page).to_not have_content(movie)
    else
      expect(page).to have_content(movie)
    end
  end
end

Then /^I should see all the movies$/ do
  # Make sure that all the movies in the app are visible in the table
  all_titles = Movie.all.pluck(:title).join(', ')
  steps %Q{
  Then I should see the following movies: #{all_titles}
}
end