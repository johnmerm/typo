Feature: Merge Articles
  As a blog administrator
  In order to combine articles with similar content
  I want to be able to merge articles

  Background:
    Given the blog is set up
    Given the following articles exist:
    | title | author | body          | published | 
    | first | joe    | First Article | true      |
    | second| martin | Second Article| true      |

  	Given the following comments exist:
  	|article_title	|body					|
  	|first			|First Article Comment 	|
  	|second			|Second Article Comment	|
  
  Scenario: An admin can merge articles
    Given I log in as "admin"
    And I follow "All Articles"
    Given I follow "first"
    Then I should see "Merge Articles"

  Scenario: A non-admin cannot merge articles. 
	Given I log in as "publisher"
	And I follow "All Articles"
    When I follow "second"
    Then I should not see "Merge Articles"
    
  Scenario: When articles are merged, the merged article should contain the text of both previous articles.
    Given I log in as "admin"
    And I follow "All Articles"
    When I follow "first"
    And I fill in "merge_with" with title:"second"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "first"
    And I should not see "second"
    When I follow "first"
    Then I should see "First Article"
    And I should see "Second Article"
  
  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.
	Given I log in as "admin"
	When I visit the comments for article "first"
	Then I should see "First Article Comment" 
	And I should not see "Second Article Comment"
	When I visit the comments for article "second"
	Then I should see "Second Article Comment" 
	And I should not see "First Article Comment"
	
	When I visit the edit page for article "first"
	And I fill in "merge_with" with title:"second"
	And I press "Merge"
	
	When I visit the comments for article "first"
	Then I should see "First Article Comment" 
	And I should see "Second Article Comment"
	
  Scenario: The title of the new article should be the title from either one of the merged articles.
    Given I log in as "admin"
    And I follow "All Articles"
    When I follow "first"
    And I fill in "merge_with" with title:"second"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "first"
    And I should not see "second"
  
  
