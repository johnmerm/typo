Feature: Create conversation
	As a blog administrator
	I want to create categories
	Background:
		Given the blog is set up
		Given the following categories exist:
		|name			|description	|permalink		|
		|OneCategory	|OneCategory	|OneCategory	|
		|OtherCategory	|OtherCategory	|OtherCategory	|
	Scenario: An admin can navigate to Categories link
		Given I log in as "admin"
    	And I follow "Categories"
    	Then I should be on the Categories page
    	And I should see "OneCategory"
    	And I should see "OtherCategory"
    	
    Scenario: An admin can create a new Conversation
    	Given I log in as "admin"
    	And I follow "Categories"
    	
    	When I fill in "category_name" with "ThirdCategory"
    	And I press "Save"
    	
    	Then I should be on the Categories page
    	And I should see "ThirdCategory"
    	And I should see "Category was successfully saved."
    
    Scenario: An admin can edit an existing Category
    	Given I log in as "admin"
    	And I follow "Categories"
    	
    	Then I should be on the Categories page
    	And I should see "OneCategory"
    	
    	When I follow "OneCategory"
    	Then I should be on the edit page for category "OneCategory" 
    	
    	When I fill in "category_name" with "ThirdCategory"
    	And  I fill in "category_description" with "ThirdCategory"
    	When I fill in "category_permalink" with "ThirdCategory"
    	And  I press "Save"
    	
    	Then I should see "ThirdCategory"
    	And I should see "Category was successfully saved."
    	But I should not see "OneCategory"
	
