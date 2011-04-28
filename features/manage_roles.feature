Feature: Manage roles
  In order to manage roles
  as an Admin
  I want to create and edit roles.

  Scenario: Register new role
	Given I am logged in as "don" with password "secret" with role "admin"
    And I am on the new role page
    When I fill in "Name" with "name 1"
    And I press "Create"
    Then I should see "name 1"

  Scenario: Delete role
	Given I am logged in as "don" with password "secret" with role "admin"
    And the following roles:
      | name   |
      | name 2 |
      | name 3 |
      | name 4 |

    When I delete the 3rd role
    Then I should see the following roles:
      | Name   |
      | admin  |
      | name 2 |
      | name 4 |

