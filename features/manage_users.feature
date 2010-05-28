Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new user
    Given the following roles:
      |name|
      |admin|
      
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

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # dialogs.
  #
  # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # detect the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # will also turn off the emulation. (See the Capybara documentation for 
  # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
  
  Scenario: Delete user
    Given the following roles:
      |name|
      |admin|
      |guest|
    And the following users:
      |username  |email|password|password_confirmation|role_ids|
      |don       |email1@example.com|secret|secret|1|
      |username 2|email2@example.com|secret|secret|2|
      |username 3|email3@example.com|secret|secret|2|
      |username 4|email4@example.com|secret|secret|2|
    And I am logged in as "don" with password "secret"
    When I delete the 3rd user
    Then I should see the following users:
      |Username  |Email|
      |don       |email1@example.com|
      |username 2|email2@example.com|
      |username 4|email4@example.com|
      
@focus
  Scenario: Admin sees all user's edit links
    Given the following roles:
      |name|
      |admin|
      |guest|
    And the following users:
      |username  |email|password|password_confirmation|role_ids|
      |don       |email1@example.com|secret|secret|1|
      |username 2|email2@example.com|secret|secret|2|
      |username 3|email3@example.com|secret|secret|2|
      |username 4|email4@example.com|secret|secret|2|
    And I am logged in as "don" with password "secret"
    Then I should see the following users:
      |Username  |Email|Show|Edit|Destroy|
      |don       |email1@example.com|Show|Edit|Destroy|
      |username 2|email2@example.com|Show|Edit|Destroy|
      |username 3|email3@example.com|Show|Edit|Destroy|
      |username 4|email4@example.com|Show|Edit|Destroy|