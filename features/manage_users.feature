Feature: Manage users
  In order to manage Users
  As an Admin
  I want to manage users

  Scenario: Register new user
    Given the following roles:
      | name  |
      | admin |
    And I am on the new user page
    When I fill in "Username" with "username 1"
    And I fill in "Email" with "example@example.com"
    And I fill in "Password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I check "admin"
    And I press "Create"
    Then I should see "username 1"
    And I should see "example@example.com"
    And I should see "admin"
  
  Scenario: Delete user
    Given the following roles:
      | name  |
      | admin |
      | guest |

    And the following users:
      | username   | email              | password | password_confirmation | role_ids |
      | don        | email1@example.com | secret   | secret                | 1        |
      | username 2 | email2@example.com | secret   | secret                | 2        |
      | username 3 | email3@example.com | secret   | secret                | 2        |
      | username 4 | email4@example.com | secret   | secret                | 2        |

    And I am logged in as "don" with password "secret"
    When I delete the 3rd user
    Then I should see the following users:
      | Username   | Email              |
      | don        | email1@example.com |
      | username 2 | email2@example.com |
      | username 4 | email4@example.com |

      
  Scenario: Admin sees all user's edit links
	Given the following roles:
      | name  |
      | admin |
      | guest |

    And the following users:
      | username   | email              | password | password_confirmation | role_ids |
      | don        | email1@example.com | secret   | secret                | 1        |
      | username 2 | email2@example.com | secret   | secret                | 2        |
      | username 3 | email3@example.com | secret   | secret                | 2        |
      | username 4 | email4@example.com | secret   | secret                | 2        |

    And I am logged in as "don" with password "secret"
    Then I should see the following users:
      | Username   | Email              | Show | Edit | Destroy |
      | don        | email1@example.com | Show | Edit | Destroy |
      | username 2 | email2@example.com | Show | Edit | Destroy |
      | username 3 | email3@example.com | Show | Edit | Destroy |
      | username 4 | email4@example.com | Show | Edit | Destroy |

    And I should see "New User"

  Scenario: guest sees all user's and Show links, but no edit or destroy links
	Given the following roles:
      | name  |
      | admin |
      | guest |

    And the following users:
      | username   | email              | password | password_confirmation | role_ids |
      | don        | email1@example.com | secret   | secret                | 1        |
      | jimmy      | email2@example.com | secret   | secret                | 2        |
      | username 3 | email3@example.com | secret   | secret                | 2        |
      | username 4 | email4@example.com | secret   | secret                | 2        |

    And I am logged in as "jimmy" with password "secret"
    Then I should see the following users:
      | Username   | Email              | Show | Edit | Destroy |
      | don        | email1@example.com | Show |      |         |
      | jimmy      | email2@example.com | Show |      |         |
      | username 3 | email3@example.com | Show |      |         |
      | username 4 | email4@example.com | Show |      |         |

    And I should not see "New User"