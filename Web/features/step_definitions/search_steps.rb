Given 'user access to home page' do
  @app.home.load
  custom_wait(10).until { @app.home.has_input_search? }
end

When 'user able to search a course about {string}' do |content|
  @content = content
  @app.home.input_search.click
  @app.home.input_search.set content
  custom_wait(10).until { @app.search_result.has_no_spinner? }
  @app.home.search_button.click
end

Then('user verify the course should be successfully searched') do
  custom_wait(10).until { @app.search_result.has_no_spinner? }
  custom_wait.until { @app.search_result.has_course_title? }
  actual_total_result = @app.search_result.course_title.size
  expect(actual_total_result.to_s).to eql @app.search_result.total_result.text
  expect(@app.search_result.total_item.text.include? actual_total_result.to_s).to be true
  expect(@app.search_result.pagination.size).to eql 1 if actual_total_result <= 20
  byebug
end

Then 'user verify the data course is not found' do
  custom_wait(10).until { @app.search_result.has_no_spinner? }
  expect(@app.search_result.text_data_not_found.text.eql? 'Maaf, kami tidak menemukan hasil untuk').to be true
  expect(@app.search_result.seach_data.text.include? @content).to be true
end