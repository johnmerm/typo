Given /^I log in as "(.*)"$/ do |login|
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


Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    a = Article.create!(article)
    assert a !=nil
  end
end

Given /the following comments exist/ do |comment_table|
  comment_table.hashes.each do |comment|
    article = Article.where(:title => comment[:article_title]).first
    assert article !=nil
    Comment.create!({:article_id => article.id.to_s, :body => comment[:body], :author => article.author, :published =>article.published})
  end
end

Given /I visit the comments for article "(.*)"/ do |title|
  visit '/admin/feedback/article/'+Article.where(:title => title).first.id.to_s
end

When /I fill in "(.*)" with title:"(.*)"/ do |field, title|
  fill_in(field, :with => Article.where(:title => title).first.id.to_s )
end
  

Given /I visit the edit page for article "(.*)"/ do |title|
  visit '/admin/content/edit/'+Article.where(:title => title).first.id.to_s
end
