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
    	GivenScenario: 	An admin can navigate to Categories link
    	When I fill in "Name" with "ThirdCategory"
    	And I press "Save"
    	Then I should be on Categories page
    	And I should see "ThirdCategory"
	