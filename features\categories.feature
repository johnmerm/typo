Feature: Create conversation\
	As a blog administrator
	I want to create categories
	Background:
		Given the blog is set up
		Given the following categories exist:
		|name			|description	|permalink		|
		|OneCategory	|OneCategory	|OneCategory	|
		|OtherCategory	|OtherCategory	|OtherCategory	|
	Scenario: An admin can create a new category
		Given I log in as "admin"
    	And I follow "Categories"
    	Then I should see "Categories"
	