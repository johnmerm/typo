
And /^I log in as "(.*)"$/ do |login|
  user = User.find_by_login(login)
  
  visit '/accounts/login'
  fill_in 'user_login', :with => login
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end


Given /the following feedback exist/ do |feedback_table|
  feedback_table.hashes.each do |feedback|
    Feedback.create!(feedback)
  end
end

Given /the following contents exist/ do |contents_table|
  contents_table.hashes.each do |content|
    Article.create!(content)
  end
end