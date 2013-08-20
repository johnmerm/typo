Feature: Merge Articles
  As a blog administrator
  In order to combine articles with similar content
  I want to be able to merge articles

  Background:
    Given the blog is set up
    Given the following contents exist:
    | title | author | body           | published | id |
    | first | joe    | the first blog | t         | 2  |
    | second| martin | the publi blog | t         | 3  |

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
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    When I follow "first"
    Then I should see "the first blogWelcome to Typo. This is your first article. Edit or delete it, then start blogging!"
  
  Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article).
    Given I log in as "admin"
    And I follow "All Articles"
    When I follow "first"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should see "joe"

  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.

  Scenario: The title of the new article should be the title from either one of the merged articles.
    Given I log in as "admin"
    And I follow "All Articles"
    When I follow "first"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "first"
    And I should not see "Hello World!"
  
  
